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
Updated: 2026-08-19T09:25:10.883722+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.936 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.697 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.698 |  |
| ap-northeast-3 | 0.604 |  |
| ap-south-1 | 0.882 |  |
| ap-south-2 | 1.006 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.769 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.119 | 18 |
| ca-west-1 | 0.212 |  |
| eu-central-1 | 0.427 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.477 |  |
| eu-south-1 | 0.468 |  |
| eu-south-2 | 0.487 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.401 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.818 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.539 |  |
| us-east-1 | 0.084 | 5021 |
| us-east-2 | 0.095 | 1680 |
| us-gov-east-1 | 0.085 | 1853 |
| us-gov-west-1 | 0.274 | 224 |
| us-west-1 | 0.203 | 3993 |
| us-west-2 | 0.274 | 182 |

