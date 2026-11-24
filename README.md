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
Updated: 2026-11-24T06:37:15.742368+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.743 |  |
| ap-east-1 | 0.506 |  |
| ap-east-2 | 0.460 |  |
| ap-northeast-1 | 0.369 |  |
| ap-northeast-2 | 0.450 |  |
| ap-northeast-3 | 0.390 |  |
| ap-south-1 | 0.708 |  |
| ap-south-2 | 0.710 |  |
| ap-southeast-1 | 0.562 |  |
| ap-southeast-2 | 0.485 |  |
| ap-southeast-3 | 0.617 |  |
| ap-southeast-4 | 0.548 |  |
| ap-southeast-5 | 0.576 |  |
| ap-southeast-6 | 0.512 |  |
| ap-southeast-7 | 0.639 |  |
| ca-central-1 | 0.168 | 18 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.393 |  |
| eu-central-2 | 0.407 |  |
| eu-north-1 | 0.423 |  |
| eu-south-1 | 0.412 |  |
| eu-south-2 | 0.406 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.368 |  |
| eu-west-3 | 0.387 |  |
| il-central-1 | 0.527 |  |
| me-central-1 | 0.681 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.715 |  |
| mx-central-1 | 0.165 |  |
| sa-east-1 | 0.488 |  |
| us-east-1 | 0.146 | 5195 |
| us-east-2 | 0.121 | 1730 |
| us-gov-east-1 | 0.136 | 1966 |
| us-gov-west-1 | 0.126 | 249 |
| us-west-1 | 0.083 | 4224 |
| us-west-2 | 0.123 | 200 |

