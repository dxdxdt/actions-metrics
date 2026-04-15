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
Updated: 2026-04-15T21:44:47.533065+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.924 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.737 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.863 |  |
| ap-southeast-2 | 0.786 |  |
| ap-southeast-3 | 0.915 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.430 |  |
| eu-central-2 | 0.442 |  |
| eu-north-1 | 0.485 |  |
| eu-south-1 | 0.446 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.355 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.410 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.075 | 4508 |
| us-east-2 | 0.072 | 1502 |
| us-gov-east-1 | 0.078 | 1649 |
| us-gov-west-1 | 0.300 | 193 |
| us-west-1 | 0.238 | 3418 |
| us-west-2 | 0.296 | 156 |

