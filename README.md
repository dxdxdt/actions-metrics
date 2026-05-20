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
Updated: 2026-05-20T19:15:49.343814+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.859 |  |
| ap-east-1 | 0.849 |  |
| ap-east-2 | 0.780 |  |
| ap-northeast-1 | 0.657 |  |
| ap-northeast-2 | 0.782 |  |
| ap-northeast-3 | 0.694 |  |
| ap-south-1 | 0.819 |  |
| ap-south-2 | 0.900 |  |
| ap-southeast-1 | 0.919 |  |
| ap-southeast-2 | 0.812 |  |
| ap-southeast-3 | 0.968 |  |
| ap-southeast-4 | 0.849 |  |
| ap-southeast-5 | 0.946 |  |
| ap-southeast-6 | 0.851 |  |
| ap-southeast-7 | 1.020 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.308 |  |
| eu-central-1 | 0.374 |  |
| eu-central-2 | 0.389 |  |
| eu-north-1 | 0.411 |  |
| eu-south-1 | 0.393 |  |
| eu-south-2 | 0.409 |  |
| eu-west-1 | 0.289 |  |
| eu-west-2 | 0.323 |  |
| eu-west-3 | 0.355 |  |
| il-central-1 | 0.526 |  |
| me-central-1 | 0.779 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.475 |  |
| us-east-1 | 0.044 | 4669 |
| us-east-2 | 0.088 | 1603 |
| us-gov-east-1 | 0.088 | 1699 |
| us-gov-west-1 | 0.344 | 195 |
| us-west-1 | 0.270 | 3581 |
| us-west-2 | 0.339 | 158 |

