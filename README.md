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
Updated: 2026-05-01T13:01:00.912277+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.741 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.564 |  |
| ap-northeast-2 | 0.679 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.885 |  |
| ap-southeast-4 | 0.766 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.769 |  |
| ap-southeast-7 | 0.926 |  |
| ca-central-1 | 0.180 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.390 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.638 |  |
| me-central-1 | 0.838 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.132 | 4579 |
| us-east-2 | 0.135 | 1553 |
| us-gov-east-1 | 0.140 | 1669 |
| us-gov-west-1 | 0.246 | 194 |
| us-west-1 | 0.198 | 3510 |
| us-west-2 | 0.255 | 157 |

