---
layout: page
permalink: /publications/
title: Publications
description: Published papers and working papers on reservation-based congestion management and urban logistics.
nav: true
nav_order: 1
---

<!-- _pages/publications.md -->

<div class="publications">
  <h2>Published papers</h2>
  {% bibliography --query @*[journal!=Working Paper] %}

  <h2>Working papers</h2>
  {% bibliography --query @*[journal=Working Paper] %}
</div>
