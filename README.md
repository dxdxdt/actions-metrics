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
Updated: 2026-06-16T07:18:02.951889+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.957 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.785 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.838 |  |
| ap-southeast-4 | 0.737 |  |
| ap-southeast-5 | 0.808 |  |
| ap-southeast-6 | 0.727 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.200 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.505 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.389 |  |
| eu-west-2 | 0.429 |  |
| eu-west-3 | 0.459 |  |
| il-central-1 | 0.631 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.155 | 4761 |
| us-east-2 | 0.142 | 1634 |
| us-gov-east-1 | 0.143 | 1713 |
| us-gov-west-1 | 0.210 | 198 |
| us-west-1 | 0.156 | 3671 |
| us-west-2 | 0.216 | 163 |

