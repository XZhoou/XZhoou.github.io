require 'minitest/autorun'
require 'liquid'
require 'bibtex'
require 'yaml'

ROOT = File.expand_path('..', __dir__)

module TestUrlFilters
  def relative_url(path)
    return path if path.start_with?('http://', 'https://', '//')

    '/' + path.sub(%r{\A/}, '')
  end
end

Liquid::Template.register_filter(TestUrlFilters)

class FigureTemplateTest < Minitest::Test
  def setup
    @site = YAML.load_file(File.join(ROOT, '_config.yml'))
    @template = Liquid::Template.parse(File.read(ENV.fetch('FIGURE_TEMPLATE', File.join(ROOT, '_includes/figure.liquid'))))
  end

  def render(path, **options)
    @template.render!('site' => @site, 'include' => { 'path' => path }.merge(options.transform_keys(&:to_s)))
  end

  def test_local_images_have_responsive_webp_sources
    ['assets/img/Profile_photo.jpg', '/assets/img/reservation_fig2.png'].each do |path|
      html = render(path)
      stem = path.sub(/\.[^.]+$/, '').sub(%r{\A/}, '')
      [480, 800, 1400].each { |width| assert_includes html, "/#{stem}-#{width}.webp #{width}w" }
      assert_includes html, 'type="image/webp"'
      assert_includes html, "src=\"/#{path.sub(%r{\A/}, '')}\""
    end
  end

  def test_remote_images_keep_their_original_urls
    ['https://example.com/assets/img/photo.jpg', '//example.com/assets/img/photo.jpg'].each do |url|
      html = render(url)
      refute_match(/<source\b/, html)
      assert_includes html, "src=\"#{url}\""
    end
  end

  def test_only_configured_directories_and_formats_get_webp
    ['assets/other/photo.jpg', 'assets/img-other/photo.jpg', 'assets/img/diagram.svg'].each do |path|
      refute_match(/<source\b/, render(path))
    end
  end

  def test_disabled_conversion_does_not_reference_generated_files
    @site['imagemagick']['enabled'] = false
    refute_match(/<source\b/, render('assets/img/Profile_photo.jpg'))
  end

  def test_explicit_url_is_not_overridden_by_a_local_source
    html = render('assets/img/Profile_photo.jpg', url: 'https://example.com/avatar.jpg')
    refute_match(/<source\b/, html)
    assert_includes html, 'src="https://example.com/avatar.jpg"'
  end

  def test_directory_configuration_without_trailing_slash
    @site['imagemagick']['input_directories'] = ['assets/img']
    assert_includes render('assets/img/Profile_photo.jpg'), '/assets/img/Profile_photo-480.webp 480w'
  end
end

class PublicationQueryTest < Minitest::Test
  def test_page_queries_partition_all_six_papers
    queries = File.read(File.join(ROOT, '_pages/publications.md')).scan(/bibliography --query (.*?) %}/).flatten
    assert_equal 2, queries.length
    bibliography = BibTeX.open(File.join(ROOT, '_bibliography/papers.bib'))
    groups = queries.map { |query| bibliography[query].map(&:key) }
    assert_equal [1, 5], groups.map(&:length)
    assert_empty groups[0] & groups[1]
    assert_equal bibliography.entries.keys.sort, groups.flatten.sort
    assert_equal ['sun_reservation'], groups[0]
  end
end
