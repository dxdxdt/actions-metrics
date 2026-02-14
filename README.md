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
Updated: 2026-02-14T05:39:53.227493+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.985 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.614 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.669 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.784 |  |
| ap-southeast-6 | 0.707 |  |
| ap-southeast-7 | 0.871 |  |
| ca-central-1 | 0.239 | 16 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.499 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.527 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.421 |  |
| eu-west-2 | 0.461 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.674 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.840 |  |
| mx-central-1 | 0.261 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.171 | 4119 |
| us-east-2 | 0.177 | 1339 |
| us-gov-east-1 | 0.174 | 1459 |
| us-gov-west-1 | 0.198 | 147 |
| us-west-1 | 0.142 | 3057 |
| us-west-2 | 0.201 | 125 |

