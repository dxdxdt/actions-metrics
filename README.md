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
Updated: 2026-03-14T14:22:37.647524+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.053 |  |
| ap-east-1 | 0.653 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.472 |  |
| ap-northeast-2 | 0.585 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.724 |  |
| ap-southeast-2 | 0.611 |  |
| ap-southeast-3 | 0.779 |  |
| ap-southeast-4 | 0.648 |  |
| ap-southeast-5 | 0.744 |  |
| ap-southeast-6 | 0.668 |  |
| ap-southeast-7 | 0.835 |  |
| ca-central-1 | 0.278 | 16 |
| ca-west-1 | 0.182 |  |
| eu-central-1 | 0.562 |  |
| eu-central-2 | 0.585 |  |
| eu-north-1 | 0.621 |  |
| eu-south-1 | 0.610 |  |
| eu-south-2 | 0.612 |  |
| eu-west-1 | 0.499 |  |
| eu-west-2 | 0.534 |  |
| eu-west-3 | 0.550 |  |
| il-central-1 | 0.760 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.911 |  |
| mx-central-1 | 0.255 |  |
| sa-east-1 | 0.673 |  |
| us-east-1 | 0.230 | 4279 |
| us-east-2 | 0.216 | 1422 |
| us-gov-east-1 | 0.213 | 1575 |
| us-gov-west-1 | 0.136 | 183 |
| us-west-1 | 0.089 | 3228 |
| us-west-2 | 0.138 | 146 |

