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
Updated: 2026-07-21T10:59:25.703734+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.989 |  |
| ap-east-1 | 0.682 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.603 |  |
| ap-northeast-3 | 0.527 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.761 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.718 |  |
| ap-southeast-5 | 0.777 |  |
| ap-southeast-6 | 0.716 |  |
| ap-southeast-7 | 0.858 |  |
| ca-central-1 | 0.234 | 16 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.531 |  |
| eu-central-2 | 0.541 |  |
| eu-north-1 | 0.596 |  |
| eu-south-1 | 0.547 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.448 |  |
| eu-west-2 | 0.479 |  |
| eu-west-3 | 0.514 |  |
| il-central-1 | 0.699 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.615 |  |
| us-east-1 | 0.175 | 4892 |
| us-east-2 | 0.198 | 1658 |
| us-gov-east-1 | 0.195 | 1771 |
| us-gov-west-1 | 0.193 | 206 |
| us-west-1 | 0.152 | 3814 |
| us-west-2 | 0.192 | 167 |

