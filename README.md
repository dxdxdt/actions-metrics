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
Updated: 2025-11-06T22:12:39.092759+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.756 |  |
| ap-northeast-1 | 0.552 |  |
| ap-northeast-2 | 0.656 |  |
| ap-south-1 | 0.855 |  |
| ap-southeast-1 | 0.805 |  |
| ap-southeast-2 | 0.715 |  |
| ca-central-1 | 0.143 | 15 |
| eu-central-1 | 0.487 |  |
| eu-north-1 | 0.505 |  |
| eu-south-1 | 0.486 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.441 |  |
| me-south-1 | 0.780 |  |
| sa-east-1 | 0.566 |  |
| us-east-1 | 0.122 | 3452 |
| us-east-2 | 0.093 | 1022 |
| us-gov-east-1 | 0.103 | 1143 |
| us-gov-west-1 | 0.206 | 74 |
| us-west-1 | 0.211 | 2375 |
| us-west-2 | 0.206 | 23 |

