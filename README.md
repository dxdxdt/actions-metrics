# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-04-28T05:52:20.913386+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.032 |  |
| ap-east-1 | 0.687 |  |
| ap-east-2 | 0.613 |  |
| ap-northeast-1 | 0.575 |  |
| ap-northeast-2 | 0.602 |  |
| ap-northeast-3 | 0.526 |  |
| ap-south-1 | 0.931 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.660 |  |
| ap-southeast-3 | 0.809 |  |
| ap-southeast-4 | 0.699 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.696 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.234 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.537 |  |
| eu-central-2 | 0.552 |  |
| eu-north-1 | 0.593 |  |
| eu-south-1 | 0.561 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.443 |  |
| eu-west-2 | 0.488 |  |
| eu-west-3 | 0.502 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.901 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.636 |  |
| us-east-1 | 0.186 | 4572 |
| us-east-2 | 0.155 | 1542 |
| us-gov-east-1 | 0.155 | 1666 |
| us-gov-west-1 | 0.174 | 194 |
| us-west-1 | 0.119 | 3493 |
| us-west-2 | 0.172 | 157 |

