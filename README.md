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
Updated: 2026-04-16T15:21:00.364736+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.998 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.630 |  |
| ap-northeast-1 | 0.513 |  |
| ap-northeast-2 | 0.618 |  |
| ap-northeast-3 | 0.545 |  |
| ap-south-1 | 0.927 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.775 |  |
| ap-southeast-2 | 0.679 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.719 |  |
| ap-southeast-5 | 0.790 |  |
| ap-southeast-6 | 0.712 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.203 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.526 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.549 |  |
| eu-south-2 | 0.553 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.631 |  |
| us-east-1 | 0.160 | 4511 |
| us-east-2 | 0.156 | 1505 |
| us-gov-east-1 | 0.152 | 1651 |
| us-gov-west-1 | 0.199 | 193 |
| us-west-1 | 0.143 | 3420 |
| us-west-2 | 0.201 | 156 |

