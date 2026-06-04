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
Updated: 2026-06-04T21:25:58.016592+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.869 |  |
| ap-east-1 | 0.826 |  |
| ap-east-2 | 0.764 |  |
| ap-northeast-1 | 0.648 |  |
| ap-northeast-2 | 0.755 |  |
| ap-northeast-3 | 0.667 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.907 |  |
| ap-southeast-2 | 0.782 |  |
| ap-southeast-3 | 0.962 |  |
| ap-southeast-4 | 0.827 |  |
| ap-southeast-5 | 0.929 |  |
| ap-southeast-6 | 0.832 |  |
| ap-southeast-7 | 1.008 |  |
| ca-central-1 | 0.122 | 16 |
| ca-west-1 | 0.294 |  |
| eu-central-1 | 0.384 |  |
| eu-central-2 | 0.418 |  |
| eu-north-1 | 0.440 |  |
| eu-south-1 | 0.433 |  |
| eu-south-2 | 0.418 |  |
| eu-west-1 | 0.310 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.362 |  |
| il-central-1 | 0.550 |  |
| me-central-1 | 0.771 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.262 |  |
| sa-east-1 | 0.489 |  |
| us-east-1 | 0.062 | 4721 |
| us-east-2 | 0.105 | 1623 |
| us-gov-east-1 | 0.107 | 1708 |
| us-gov-west-1 | 0.320 | 196 |
| us-west-1 | 0.259 | 3633 |
| us-west-2 | 0.317 | 162 |

