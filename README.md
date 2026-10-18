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
Updated: 2026-10-18T07:37:02.342291+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.685 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.532 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.861 |  |
| ap-southeast-1 | 0.765 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.733 |  |
| ap-southeast-5 | 0.781 |  |
| ap-southeast-6 | 0.724 |  |
| ap-southeast-7 | 0.865 |  |
| ca-central-1 | 0.203 | 18 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.495 |  |
| eu-central-2 | 0.518 |  |
| eu-north-1 | 0.553 |  |
| eu-south-1 | 0.524 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.428 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.484 |  |
| il-central-1 | 0.661 |  |
| me-central-1 | 0.864 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.615 |  |
| us-east-1 | 0.167 | 5151 |
| us-east-2 | 0.180 | 1702 |
| us-gov-east-1 | 0.189 | 1947 |
| us-gov-west-1 | 0.179 | 239 |
| us-west-1 | 0.176 | 4175 |
| us-west-2 | 0.179 | 195 |

