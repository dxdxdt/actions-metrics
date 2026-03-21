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
Updated: 2026-03-21T19:18:44.248448+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.781 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.832 |  |
| ap-southeast-4 | 0.727 |  |
| ap-southeast-5 | 0.794 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.179 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.511 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.536 |  |
| eu-west-1 | 0.421 |  |
| eu-west-2 | 0.458 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.884 |  |
| me-south-1 | 0.835 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.602 |  |
| us-east-1 | 0.148 | 4322 |
| us-east-2 | 0.135 | 1446 |
| us-gov-east-1 | 0.128 | 1593 |
| us-gov-west-1 | 0.187 | 189 |
| us-west-1 | 0.170 | 3274 |
| us-west-2 | 0.184 | 151 |

