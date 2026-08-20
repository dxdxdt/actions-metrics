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
Updated: 2026-08-20T00:45:09.924062+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.038 |  |
| ap-east-1 | 0.633 |  |
| ap-east-2 | 0.572 |  |
| ap-northeast-1 | 0.456 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.483 |  |
| ap-south-1 | 0.878 |  |
| ap-south-2 | 0.854 |  |
| ap-southeast-1 | 0.713 |  |
| ap-southeast-2 | 0.638 |  |
| ap-southeast-3 | 0.764 |  |
| ap-southeast-4 | 0.680 |  |
| ap-southeast-5 | 0.730 |  |
| ap-southeast-6 | 0.666 |  |
| ap-southeast-7 | 0.815 |  |
| ca-central-1 | 0.288 | 18 |
| ca-west-1 | 0.188 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.575 |  |
| eu-north-1 | 0.605 |  |
| eu-south-1 | 0.583 |  |
| eu-south-2 | 0.593 |  |
| eu-west-1 | 0.475 |  |
| eu-west-2 | 0.510 |  |
| eu-west-3 | 0.543 |  |
| il-central-1 | 0.719 |  |
| me-central-1 | 0.934 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.677 |  |
| us-east-1 | 0.226 | 5025 |
| us-east-2 | 0.239 | 1680 |
| us-gov-east-1 | 0.237 | 1856 |
| us-gov-west-1 | 0.131 | 224 |
| us-west-1 | 0.118 | 3999 |
| us-west-2 | 0.128 | 184 |

