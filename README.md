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
Updated: 2026-08-20T13:39:38.205546+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.970 |  |
| ap-east-1 | 0.710 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.530 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.557 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.994 |  |
| ap-southeast-1 | 0.784 |  |
| ap-southeast-2 | 0.692 |  |
| ap-southeast-3 | 0.841 |  |
| ap-southeast-4 | 0.731 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.892 |  |
| ca-central-1 | 0.181 | 18 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.501 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.456 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.134 | 5027 |
| us-east-2 | 0.143 | 1680 |
| us-gov-east-1 | 0.106 | 1862 |
| us-gov-west-1 | 0.204 | 224 |
| us-west-1 | 0.146 | 4002 |
| us-west-2 | 0.206 | 184 |

