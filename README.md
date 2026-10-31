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
Updated: 2026-10-31T22:09:04.739830+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.721 |  |
| ap-east-1 | 0.540 |  |
| ap-east-2 | 0.496 |  |
| ap-northeast-1 | 0.408 |  |
| ap-northeast-2 | 0.487 |  |
| ap-northeast-3 | 0.427 |  |
| ap-south-1 | 0.692 |  |
| ap-south-2 | 0.753 |  |
| ap-southeast-1 | 0.599 |  |
| ap-southeast-2 | 0.526 |  |
| ap-southeast-3 | 0.645 |  |
| ap-southeast-4 | 0.588 |  |
| ap-southeast-5 | 0.612 |  |
| ap-southeast-6 | 0.544 |  |
| ap-southeast-7 | 0.675 |  |
| ca-central-1 | 0.111 | 18 |
| ca-west-1 | 0.148 |  |
| eu-central-1 | 0.362 |  |
| eu-central-2 | 0.389 |  |
| eu-north-1 | 0.385 |  |
| eu-south-1 | 0.369 |  |
| eu-south-2 | 0.377 |  |
| eu-west-1 | 0.303 |  |
| eu-west-2 | 0.324 |  |
| eu-west-3 | 0.344 |  |
| il-central-1 | 0.475 |  |
| me-central-1 | 0.619 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.141 |  |
| sa-east-1 | 0.446 |  |
| us-east-1 | 0.100 | 5168 |
| us-east-2 | 0.074 | 1718 |
| us-gov-east-1 | 0.089 | 1956 |
| us-gov-west-1 | 0.164 | 241 |
| us-west-1 | 0.122 | 4203 |
| us-west-2 | 0.166 | 195 |

