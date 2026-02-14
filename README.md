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
Updated: 2026-02-14T06:35:53.393098+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.702 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.634 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.959 |  |
| ap-southeast-1 | 0.778 |  |
| ap-southeast-2 | 0.693 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.732 |  |
| ap-southeast-5 | 0.799 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.192 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.492 |  |
| eu-central-2 | 0.502 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.406 |  |
| eu-west-2 | 0.447 |  |
| eu-west-3 | 0.467 |  |
| il-central-1 | 0.661 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.829 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.610 |  |
| us-east-1 | 0.147 | 4119 |
| us-east-2 | 0.139 | 1339 |
| us-gov-east-1 | 0.129 | 1460 |
| us-gov-west-1 | 0.198 | 147 |
| us-west-1 | 0.178 | 3057 |
| us-west-2 | 0.200 | 125 |

