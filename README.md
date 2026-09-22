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
Updated: 2026-09-22T22:35:24.102422+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.777 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.698 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.903 |  |
| ap-southeast-2 | 0.751 |  |
| ap-southeast-3 | 0.939 |  |
| ap-southeast-4 | 0.796 |  |
| ap-southeast-5 | 0.903 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.986 |  |
| ca-central-1 | 0.132 | 18 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.424 |  |
| eu-central-2 | 0.441 |  |
| eu-north-1 | 0.480 |  |
| eu-south-1 | 0.447 |  |
| eu-south-2 | 0.460 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.383 |  |
| eu-west-3 | 0.411 |  |
| il-central-1 | 0.587 |  |
| me-central-1 | 0.823 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.084 | 5114 |
| us-east-2 | 0.114 | 1686 |
| us-gov-east-1 | 0.118 | 1924 |
| us-gov-west-1 | 0.270 | 235 |
| us-west-1 | 0.218 | 4133 |
| us-west-2 | 0.279 | 192 |

