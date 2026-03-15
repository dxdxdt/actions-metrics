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
Updated: 2026-03-15T16:23:16.312533+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.981 |  |
| ap-east-1 | 0.688 |  |
| ap-east-2 | 0.630 |  |
| ap-northeast-1 | 0.510 |  |
| ap-northeast-2 | 0.618 |  |
| ap-northeast-3 | 0.539 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.767 |  |
| ap-southeast-2 | 0.672 |  |
| ap-southeast-3 | 0.823 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.787 |  |
| ap-southeast-6 | 0.724 |  |
| ap-southeast-7 | 0.871 |  |
| ca-central-1 | 0.230 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.492 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.520 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.429 |  |
| eu-west-2 | 0.457 |  |
| eu-west-3 | 0.470 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.835 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.164 | 4284 |
| us-east-2 | 0.179 | 1424 |
| us-gov-east-1 | 0.170 | 1577 |
| us-gov-west-1 | 0.195 | 185 |
| us-west-1 | 0.145 | 3237 |
| us-west-2 | 0.196 | 148 |

