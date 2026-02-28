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
Updated: 2026-02-28T15:15:28.269345+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.691 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.509 |  |
| ap-northeast-2 | 0.615 |  |
| ap-northeast-3 | 0.532 |  |
| ap-south-1 | 0.947 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.820 |  |
| ap-southeast-4 | 0.718 |  |
| ap-southeast-5 | 0.787 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.865 |  |
| ca-central-1 | 0.215 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.503 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.564 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.543 |  |
| eu-west-1 | 0.419 |  |
| eu-west-2 | 0.465 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.822 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.166 | 4199 |
| us-east-2 | 0.159 | 1383 |
| us-gov-east-1 | 0.159 | 1518 |
| us-gov-west-1 | 0.179 | 166 |
| us-west-1 | 0.160 | 3142 |
| us-west-2 | 0.180 | 133 |

