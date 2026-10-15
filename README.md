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
Updated: 2026-10-15T12:21:08.632537+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.688 |  |
| ap-east-2 | 0.624 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.621 |  |
| ap-northeast-3 | 0.532 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.670 |  |
| ap-southeast-3 | 0.820 |  |
| ap-southeast-4 | 0.715 |  |
| ap-southeast-5 | 0.781 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.202 | 18 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.513 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.557 |  |
| eu-south-1 | 0.538 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.441 |  |
| eu-west-2 | 0.471 |  |
| eu-west-3 | 0.490 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.883 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.170 | 5148 |
| us-east-2 | 0.137 | 1699 |
| us-gov-east-1 | 0.154 | 1941 |
| us-gov-west-1 | 0.173 | 238 |
| us-west-1 | 0.142 | 4170 |
| us-west-2 | 0.174 | 194 |

