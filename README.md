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
Updated: 2026-03-23T15:54:13.805353+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.023 |  |
| ap-east-1 | 0.678 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.495 |  |
| ap-northeast-2 | 0.618 |  |
| ap-northeast-3 | 0.522 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.757 |  |
| ap-southeast-2 | 0.642 |  |
| ap-southeast-3 | 0.807 |  |
| ap-southeast-4 | 0.688 |  |
| ap-southeast-5 | 0.777 |  |
| ap-southeast-6 | 0.679 |  |
| ap-southeast-7 | 0.860 |  |
| ca-central-1 | 0.255 | 16 |
| ca-west-1 | 0.197 |  |
| eu-central-1 | 0.550 |  |
| eu-central-2 | 0.554 |  |
| eu-north-1 | 0.613 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.487 |  |
| eu-west-3 | 0.517 |  |
| il-central-1 | 0.713 |  |
| me-central-1 | 0.922 |  |
| me-south-1 | 0.864 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.668 |  |
| us-east-1 | 0.203 | 4339 |
| us-east-2 | 0.188 | 1448 |
| us-gov-east-1 | 0.194 | 1596 |
| us-gov-west-1 | 0.174 | 190 |
| us-west-1 | 0.121 | 3287 |
| us-west-2 | 0.170 | 151 |

