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
Updated: 2026-08-13T22:32:57.440816+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.686 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.610 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.866 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.637 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.685 |  |
| ap-southeast-5 | 0.779 |  |
| ap-southeast-6 | 0.700 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.266 | 18 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.523 |  |
| eu-central-2 | 0.546 |  |
| eu-north-1 | 0.584 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.454 |  |
| eu-west-2 | 0.483 |  |
| eu-west-3 | 0.503 |  |
| il-central-1 | 0.690 |  |
| me-central-1 | 0.914 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.196 | 4989 |
| us-east-2 | 0.211 | 1679 |
| us-gov-east-1 | 0.210 | 1825 |
| us-gov-west-1 | 0.172 | 222 |
| us-west-1 | 0.113 | 3942 |
| us-west-2 | 0.176 | 176 |

