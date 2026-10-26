---
layout: page
title: Drone elevator coordination scheme
description: Drone delivery combined with cargo elevator for three-dimensional logistics, separating passenger and parcel flows to alleviate vertical congestion.
img: assets/img/vertical_transportation_illustration.jpg
importance: 2
category: research
---

## Drone-elevator coordination for managing vertical congestion and parcel delivery in high-rise buildings

*Sun, Qi-Hang and Guo, Ren-Yong*.

### Research problem

High-rise buildings concentrate people and activities within a limited land area, generating demand for vertical passenger movement and parcel delivery. During rush hours, passenger and parcel movements compete for limited elevator capacity, leading to vertical congestion and delaying parcel delivery.

### Approach

We propose a drone-elevator coordination scheme in which a drone transfers parcels to a rooftop transfer locker (RTL) and a designated cargo car completes their in-building delivery. The RTL uses two exchangeable cargo modules and supports itemized loading and module exchange. Itemized loading transfers selected parcels individually, whereas module exchange loads an on-hand batch by exchanging the receiving and onboard modules.

{% include figure.liquid loading="eager" path="assets/img/vertical_transportation_illustration.jpg" class="img-fluid rounded z-depth-1" caption="Drone-elevator coordination and cargo module exchange." alt="Comparison of courier delivery from the lobby with drone handoff at a rooftop transfer locker and cargo-car delivery, with exchangeable receiving and onboard modules." %}

Given rooftop parcel arrivals, we formulate a mixed-integer linear programming model for cargo scheduling. The model jointly determines loading modes, parcel batching, transfer sequencing and timing, and floor routing. The model minimizes a weighted sum of normalized parcel fulfillment time and tardiness. Dominance properties reduce the loading candidates considered by a branch-and-bound algorithm. We use an adaptive large neighborhood search heuristic for larger instances.

### Findings

We compare the proposed scheme with immediate courier service, in which couriers use passenger cars to deliver parcels individually. Despite designating one car for cargo service, the scheme reduces mean passenger waiting time by 65.9% under collective control and 63.2% under destination dispatch at moderate passenger demand and a 50% target parcel movement share. In the same scenario, the proposed scheme maintains the same 100% parcel on-time delivery rate as immediate courier service.

### Resources

- Working paper listing: [Publications]({% link _pages/publications.md %})

{% comment %}
## Coordinating Drone Routing and Vertical Delivery

*Sun, Qi-Hang and Guo, Ren-Yong*.

Ongoing work, the abstract is to be completed.
{% endcomment %}
