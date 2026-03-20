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
Updated: 2026-03-20T09:34:08.839196+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.005 |  |
| ap-east-1 | 0.705 |  |
| ap-east-2 | 0.650 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.554 |  |
| ap-south-1 | 0.940 |  |
| ap-south-2 | 0.994 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.695 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.225 | 16 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.496 |  |
| eu-central-2 | 0.515 |  |
| eu-north-1 | 0.553 |  |
| eu-south-1 | 0.528 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.434 |  |
| eu-west-2 | 0.468 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.691 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.832 |  |
| mx-central-1 | 0.188 |  |
| sa-east-1 | 0.606 |  |
| us-east-1 | 0.164 | 4312 |
| us-east-2 | 0.133 | 1439 |
| us-gov-east-1 | 0.139 | 1590 |
| us-gov-west-1 | 0.199 | 189 |
| us-west-1 | 0.167 | 3266 |
| us-west-2 | 0.184 | 148 |

