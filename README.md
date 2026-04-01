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
Updated: 2026-04-01T11:04:40.417141+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.682 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.614 |  |
| ap-northeast-3 | 0.532 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.648 |  |
| ap-southeast-3 | 0.819 |  |
| ap-southeast-4 | 0.690 |  |
| ap-southeast-5 | 0.777 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.250 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.529 |  |
| eu-central-2 | 0.555 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.554 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.500 |  |
| eu-west-3 | 0.512 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.905 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.697 |  |
| us-east-1 | 0.190 | 4414 |
| us-east-2 | 0.176 | 1470 |
| us-gov-east-1 | 0.178 | 1618 |
| us-gov-west-1 | 0.171 | 190 |
| us-west-1 | 0.117 | 3329 |
| us-west-2 | 0.171 | 153 |

