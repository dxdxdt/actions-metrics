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
Updated: 2026-08-09T07:46:50.843584+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.893 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.605 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.622 |  |
| ap-south-1 | 0.836 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.864 |  |
| ap-southeast-2 | 0.748 |  |
| ap-southeast-3 | 0.919 |  |
| ap-southeast-4 | 0.791 |  |
| ap-southeast-5 | 0.891 |  |
| ap-southeast-6 | 0.826 |  |
| ap-southeast-7 | 0.974 |  |
| ca-central-1 | 0.146 | 18 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.411 |  |
| eu-central-2 | 0.428 |  |
| eu-north-1 | 0.455 |  |
| eu-south-1 | 0.444 |  |
| eu-south-2 | 0.448 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.373 |  |
| eu-west-3 | 0.390 |  |
| il-central-1 | 0.570 |  |
| me-central-1 | 0.823 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.518 |  |
| us-east-1 | 0.082 | 4960 |
| us-east-2 | 0.115 | 1677 |
| us-gov-east-1 | 0.125 | 1810 |
| us-gov-west-1 | 0.281 | 214 |
| us-west-1 | 0.219 | 3909 |
| us-west-2 | 0.281 | 175 |

