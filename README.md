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
Updated: 2026-04-25T11:33:55.335745+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.021 |  |
| ap-east-1 | 0.679 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.526 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.755 |  |
| ap-southeast-2 | 0.655 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.691 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.858 |  |
| ca-central-1 | 0.246 | 16 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.524 |  |
| eu-central-2 | 0.568 |  |
| eu-north-1 | 0.588 |  |
| eu-south-1 | 0.549 |  |
| eu-south-2 | 0.562 |  |
| eu-west-1 | 0.454 |  |
| eu-west-2 | 0.493 |  |
| eu-west-3 | 0.515 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.907 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.638 |  |
| us-east-1 | 0.192 | 4561 |
| us-east-2 | 0.179 | 1528 |
| us-gov-east-1 | 0.189 | 1663 |
| us-gov-west-1 | 0.171 | 194 |
| us-west-1 | 0.119 | 3477 |
| us-west-2 | 0.169 | 157 |

