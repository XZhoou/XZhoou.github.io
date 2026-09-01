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

High-rise buildings face two connected operational issues: vertical congestion caused by limited elevator capacity and timely parcel delivery to destination floors. We propose a drone-elevator coordination scheme in which a drone transfers parcels to a rooftop transfer locker (RTL) and a designated cargo car completes their in-building delivery. The RTL uses two exchangeable cargo modules and supports itemized loading and module exchange. Itemized loading transfers selected parcels individually, whereas module exchange loads an on-hand batch by exchanging the receiving and onboard modules. We formulate a mixed-integer linear cargo scheduling model that jointly determines loading modes, transfer timing, batching, and floor routing. The objective minimizes a weighted sum of normalized parcel fulfillment time and tardiness and therefore accounts explicitly for in-building delivery delay. We evaluate the scheme against conventional parcel-induced passenger movement, represented by immediate courier service, using paired passenger and parcel simulations. At a passenger arrival rate of 0.07 groups/s and a 50% target parcel movement share, the scheme reduces mean passenger waiting time by 65.9% under collective control and 63.2% under destination dispatch. All 20 cargo replications yield capacity-feasible schedules and on-time parcel delivery at the baseline 45-slot RTL capacity. The scheme is intended for high-rise buildings with frequent time-sensitive parcel requests and parcel volumes large enough to support recurring rooftop transfer and cargo-car operation. Under these premises, rooftop transfer coordinates parcel delivery with the management of vertical congestion.

{% include figure.liquid loading="eager" path="assets/img/vertical_transportation_illustration.jpg" class="img-fluid rounded z-depth-1" %}

## Resources

- SSRN preprint: [Passenger and freight separation for vertical congestion management in high-rise buildings: A rooftop drone handoff and cargo-elevator scheme](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=7119618)
