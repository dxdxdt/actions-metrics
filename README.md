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
Updated: 2026-02-11T15:54:06.208668+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.884 |  |
| ap-east-1 | 0.803 |  |
| ap-northeast-1 | 0.614 |  |
| ap-northeast-2 | 0.738 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.960 |  |
| ap-southeast-1 | 0.894 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.933 |  |
| ap-southeast-4 | 0.814 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.390 |  |
| eu-central-2 | 0.415 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.419 |  |
| eu-south-2 | 0.423 |  |
| eu-west-1 | 0.320 |  |
| eu-west-2 | 0.349 |  |
| eu-west-3 | 0.369 |  |
| il-central-1 | 0.558 |  |
| me-central-1 | 0.786 |  |
| me-south-1 | 0.752 |  |
| sa-east-1 | 0.497 |  |
| us-east-1 | 0.059 | 4105 |
| us-east-2 | 0.088 | 1331 |
| us-gov-east-1 | 0.087 | 1452 |
| us-gov-west-1 | 0.298 | 143 |
| us-west-1 | 0.254 | 3039 |
| us-west-2 | 0.299 | 125 |

