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
Updated: 2025-12-02T21:13:19.406895+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.799 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.710 |  |
| ap-south-1 | 0.841 |  |
| ap-southeast-1 | 0.851 |  |
| ap-southeast-2 | 0.765 |  |
| ca-central-1 | 0.109 | 15 |
| eu-central-1 | 0.425 |  |
| eu-north-1 | 0.476 |  |
| eu-south-1 | 0.445 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.401 |  |
| me-south-1 | 0.744 |  |
| sa-east-1 | 0.523 |  |
| us-east-1 | 0.081 | 3621 |
| us-east-2 | 0.084 | 1121 |
| us-gov-east-1 | 0.081 | 1218 |
| us-gov-west-1 | 0.254 | 82 |
| us-west-1 | 0.242 | 2568 |
| us-west-2 | 0.257 | 56 |

