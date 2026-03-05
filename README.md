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
Updated: 2026-03-05T21:27:41.260138+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.035 |  |
| ap-east-1 | 0.668 |  |
| ap-east-2 | 0.610 |  |
| ap-northeast-1 | 0.491 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.745 |  |
| ap-southeast-2 | 0.629 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.669 |  |
| ap-southeast-5 | 0.763 |  |
| ap-southeast-6 | 0.678 |  |
| ap-southeast-7 | 0.847 |  |
| ca-central-1 | 0.251 | 16 |
| ca-west-1 | 0.191 |  |
| eu-central-1 | 0.546 |  |
| eu-central-2 | 0.553 |  |
| eu-north-1 | 0.588 |  |
| eu-south-1 | 0.562 |  |
| eu-south-2 | 0.575 |  |
| eu-west-1 | 0.458 |  |
| eu-west-2 | 0.493 |  |
| eu-west-3 | 0.519 |  |
| il-central-1 | 0.701 |  |
| me-central-1 | 0.918 |  |
| me-south-1 | 0.881 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.660 |  |
| us-east-1 | 0.206 | 4226 |
| us-east-2 | 0.194 | 1401 |
| us-gov-east-1 | 0.205 | 1532 |
| us-gov-west-1 | 0.153 | 172 |
| us-west-1 | 0.108 | 3178 |
| us-west-2 | 0.155 | 141 |

