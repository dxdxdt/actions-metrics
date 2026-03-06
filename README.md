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
Updated: 2026-03-06T21:23:16.075176+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.055 |  |
| ap-east-1 | 0.652 |  |
| ap-east-2 | 0.593 |  |
| ap-northeast-1 | 0.471 |  |
| ap-northeast-2 | 0.577 |  |
| ap-northeast-3 | 0.499 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.726 |  |
| ap-southeast-2 | 0.617 |  |
| ap-southeast-3 | 0.780 |  |
| ap-southeast-4 | 0.656 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.669 |  |
| ap-southeast-7 | 0.826 |  |
| ca-central-1 | 0.265 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.584 |  |
| eu-central-2 | 0.590 |  |
| eu-north-1 | 0.627 |  |
| eu-south-1 | 0.603 |  |
| eu-south-2 | 0.614 |  |
| eu-west-1 | 0.493 |  |
| eu-west-2 | 0.521 |  |
| eu-west-3 | 0.553 |  |
| il-central-1 | 0.755 |  |
| me-central-1 | 0.946 |  |
| me-south-1 | 0.912 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.678 |  |
| us-east-1 | 0.231 | 4232 |
| us-east-2 | 0.199 | 1405 |
| us-gov-east-1 | 0.204 | 1532 |
| us-gov-west-1 | 0.139 | 173 |
| us-west-1 | 0.095 | 3187 |
| us-west-2 | 0.140 | 142 |

