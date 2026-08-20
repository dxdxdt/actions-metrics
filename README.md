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
Updated: 2026-08-20T02:13:06.200458+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.630 |  |
| ap-northeast-3 | 0.551 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.779 |  |
| ap-southeast-2 | 0.696 |  |
| ap-southeast-3 | 0.832 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.881 |  |
| ca-central-1 | 0.198 | 18 |
| ca-west-1 | 0.212 |  |
| eu-central-1 | 0.488 |  |
| eu-central-2 | 0.513 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.519 |  |
| eu-south-2 | 0.534 |  |
| eu-west-1 | 0.422 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.473 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.269 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.154 | 5025 |
| us-east-2 | 0.160 | 1680 |
| us-gov-east-1 | 0.147 | 1857 |
| us-gov-west-1 | 0.199 | 224 |
| us-west-1 | 0.164 | 3999 |
| us-west-2 | 0.194 | 184 |

