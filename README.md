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
Updated: 2026-03-24T05:55:43.409428+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.929 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.692 |  |
| ap-northeast-3 | 0.603 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.939 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.748 |  |
| ap-southeast-3 | 0.894 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.823 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.435 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.501 |  |
| eu-south-1 | 0.465 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.364 |  |
| eu-west-2 | 0.401 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.814 |  |
| me-south-1 | 0.783 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.537 |  |
| us-east-1 | 0.098 | 4344 |
| us-east-2 | 0.114 | 1449 |
| us-gov-east-1 | 0.118 | 1599 |
| us-gov-west-1 | 0.269 | 190 |
| us-west-1 | 0.214 | 3289 |
| us-west-2 | 0.268 | 151 |

