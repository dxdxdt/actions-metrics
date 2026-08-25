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
Updated: 2026-08-25T07:37:37.526465+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.922 |  |
| ap-east-1 | 0.755 |  |
| ap-east-2 | 0.693 |  |
| ap-northeast-1 | 0.575 |  |
| ap-northeast-2 | 0.688 |  |
| ap-northeast-3 | 0.600 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.751 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.795 |  |
| ap-southeast-5 | 0.850 |  |
| ap-southeast-6 | 0.769 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.154 | 18 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.440 |  |
| eu-central-2 | 0.461 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.459 |  |
| eu-south-2 | 0.475 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.388 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.821 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.250 |  |
| sa-east-1 | 0.548 |  |
| us-east-1 | 0.102 | 5059 |
| us-east-2 | 0.117 | 1684 |
| us-gov-east-1 | 0.129 | 1882 |
| us-gov-west-1 | 0.248 | 227 |
| us-west-1 | 0.228 | 4049 |
| us-west-2 | 0.247 | 187 |

