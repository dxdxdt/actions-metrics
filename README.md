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
Updated: 2026-05-19T22:09:41.862340+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.944 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.691 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.603 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.719 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.856 |  |
| ap-southeast-6 | 0.773 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.180 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.458 |  |
| eu-central-2 | 0.484 |  |
| eu-north-1 | 0.500 |  |
| eu-south-1 | 0.489 |  |
| eu-south-2 | 0.489 |  |
| eu-west-1 | 0.385 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.433 |  |
| il-central-1 | 0.616 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.119 | 4664 |
| us-east-2 | 0.148 | 1603 |
| us-gov-east-1 | 0.141 | 1698 |
| us-gov-west-1 | 0.255 | 195 |
| us-west-1 | 0.191 | 3580 |
| us-west-2 | 0.256 | 158 |

