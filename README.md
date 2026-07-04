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
Updated: 2026-07-04T16:03:43.857625+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.661 |  |
| ap-east-2 | 0.603 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.591 |  |
| ap-northeast-3 | 0.511 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.743 |  |
| ap-southeast-2 | 0.624 |  |
| ap-southeast-3 | 0.798 |  |
| ap-southeast-4 | 0.669 |  |
| ap-southeast-5 | 0.760 |  |
| ap-southeast-6 | 0.662 |  |
| ap-southeast-7 | 0.844 |  |
| ca-central-1 | 0.274 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.541 |  |
| eu-central-2 | 0.567 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.599 |  |
| eu-south-2 | 0.575 |  |
| eu-west-1 | 0.476 |  |
| eu-west-2 | 0.499 |  |
| eu-west-3 | 0.521 |  |
| il-central-1 | 0.710 |  |
| me-central-1 | 0.928 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.216 | 4819 |
| us-east-2 | 0.205 | 1652 |
| us-gov-east-1 | 0.208 | 1728 |
| us-gov-west-1 | 0.159 | 200 |
| us-west-1 | 0.096 | 3739 |
| us-west-2 | 0.158 | 164 |

