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
Updated: 2026-03-23T18:43:01.841010+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.998 |  |
| ap-east-1 | 0.700 |  |
| ap-east-2 | 0.644 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.626 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.784 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.836 |  |
| ap-southeast-4 | 0.727 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.727 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.218 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.516 |  |
| eu-central-2 | 0.529 |  |
| eu-north-1 | 0.564 |  |
| eu-south-1 | 0.539 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.431 |  |
| eu-west-2 | 0.468 |  |
| eu-west-3 | 0.491 |  |
| il-central-1 | 0.685 |  |
| me-central-1 | 0.891 |  |
| me-south-1 | 0.840 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.162 | 4340 |
| us-east-2 | 0.181 | 1449 |
| us-gov-east-1 | 0.182 | 1596 |
| us-gov-west-1 | 0.209 | 190 |
| us-west-1 | 0.158 | 3288 |
| us-west-2 | 0.215 | 151 |

