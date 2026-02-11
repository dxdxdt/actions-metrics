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
Updated: 2026-02-11T18:53:35.770623+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.058 |  |
| ap-east-1 | 0.645 |  |
| ap-northeast-1 | 0.465 |  |
| ap-northeast-2 | 0.571 |  |
| ap-south-1 | 0.933 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.730 |  |
| ap-southeast-2 | 0.613 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.652 |  |
| ca-central-1 | 0.274 | 16 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.574 |  |
| eu-north-1 | 0.605 |  |
| eu-south-1 | 0.609 |  |
| eu-south-2 | 0.585 |  |
| eu-west-1 | 0.473 |  |
| eu-west-2 | 0.522 |  |
| eu-west-3 | 0.536 |  |
| il-central-1 | 0.738 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.900 |  |
| sa-east-1 | 0.657 |  |
| us-east-1 | 0.220 | 4105 |
| us-east-2 | 0.212 | 1331 |
| us-gov-east-1 | 0.211 | 1452 |
| us-gov-west-1 | 0.144 | 143 |
| us-west-1 | 0.087 | 3042 |
| us-west-2 | 0.153 | 125 |

