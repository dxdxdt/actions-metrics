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
Updated: 2026-06-11T21:14:37.035841+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.672 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.863 |  |
| ap-southeast-4 | 0.753 |  |
| ap-southeast-5 | 0.828 |  |
| ap-southeast-6 | 0.753 |  |
| ap-southeast-7 | 0.917 |  |
| ca-central-1 | 0.162 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.521 |  |
| eu-south-2 | 0.503 |  |
| eu-west-1 | 0.398 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.452 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.114 | 4743 |
| us-east-2 | 0.107 | 1631 |
| us-gov-east-1 | 0.110 | 1711 |
| us-gov-west-1 | 0.231 | 198 |
| us-west-1 | 0.178 | 3658 |
| us-west-2 | 0.233 | 162 |

