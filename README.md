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
Updated: 2026-08-14T19:43:09.614618+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.972 |  |
| ap-east-1 | 0.716 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.539 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.569 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.870 |  |
| ap-southeast-1 | 0.791 |  |
| ap-southeast-2 | 0.683 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.726 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.893 |  |
| ca-central-1 | 0.221 | 18 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.533 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.451 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.165 | 4996 |
| us-east-2 | 0.177 | 1679 |
| us-gov-east-1 | 0.168 | 1827 |
| us-gov-west-1 | 0.209 | 222 |
| us-west-1 | 0.152 | 3947 |
| us-west-2 | 0.210 | 177 |

