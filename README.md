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
Updated: 2026-06-05T16:27:30.213933+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.787 |  |
| ap-east-2 | 0.715 |  |
| ap-northeast-1 | 0.600 |  |
| ap-northeast-2 | 0.714 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.834 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.851 |  |
| ap-southeast-2 | 0.761 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.806 |  |
| ap-southeast-5 | 0.872 |  |
| ap-southeast-6 | 0.798 |  |
| ap-southeast-7 | 0.954 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.449 |  |
| eu-north-1 | 0.463 |  |
| eu-south-1 | 0.455 |  |
| eu-south-2 | 0.460 |  |
| eu-west-1 | 0.345 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.575 |  |
| me-central-1 | 0.815 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.528 |  |
| us-east-1 | 0.086 | 4723 |
| us-east-2 | 0.097 | 1625 |
| us-gov-east-1 | 0.104 | 1708 |
| us-gov-west-1 | 0.283 | 196 |
| us-west-1 | 0.235 | 3635 |
| us-west-2 | 0.287 | 162 |

