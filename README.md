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
Updated: 2026-02-22T19:20:15.969484+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.926 |  |
| ap-east-1 | 0.753 |  |
| ap-east-2 | 0.690 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.686 |  |
| ap-northeast-3 | 0.604 |  |
| ap-south-1 | 0.837 |  |
| ap-south-2 | 0.843 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.727 |  |
| ap-southeast-3 | 0.885 |  |
| ap-southeast-4 | 0.771 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.172 | 16 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.440 |  |
| eu-central-2 | 0.463 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.427 |  |
| il-central-1 | 0.626 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.786 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.545 |  |
| us-east-1 | 0.111 | 4164 |
| us-east-2 | 0.134 | 1371 |
| us-gov-east-1 | 0.136 | 1500 |
| us-gov-west-1 | 0.258 | 160 |
| us-west-1 | 0.208 | 3099 |
| us-west-2 | 0.287 | 130 |

