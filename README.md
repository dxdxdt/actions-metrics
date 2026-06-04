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
Updated: 2026-06-04T13:54:56.917105+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.960 |  |
| ap-east-1 | 0.737 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.563 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.713 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.830 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.912 |  |
| ca-central-1 | 0.176 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.483 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.523 |  |
| eu-south-2 | 0.519 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.425 |  |
| eu-west-3 | 0.456 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.584 |  |
| us-east-1 | 0.142 | 4718 |
| us-east-2 | 0.116 | 1623 |
| us-gov-east-1 | 0.145 | 1708 |
| us-gov-west-1 | 0.228 | 196 |
| us-west-1 | 0.172 | 3633 |
| us-west-2 | 0.227 | 162 |

