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
Updated: 2026-07-21T14:57:47.365050+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.885 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.724 |  |
| ap-northeast-1 | 0.608 |  |
| ap-northeast-2 | 0.711 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.790 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.839 |  |
| ap-southeast-5 | 0.882 |  |
| ap-southeast-6 | 0.839 |  |
| ap-southeast-7 | 0.964 |  |
| ca-central-1 | 0.130 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.410 |  |
| eu-central-2 | 0.425 |  |
| eu-north-1 | 0.469 |  |
| eu-south-1 | 0.423 |  |
| eu-south-2 | 0.442 |  |
| eu-west-1 | 0.328 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.392 |  |
| il-central-1 | 0.577 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.504 |  |
| us-east-1 | 0.070 | 4894 |
| us-east-2 | 0.097 | 1658 |
| us-gov-east-1 | 0.113 | 1771 |
| us-gov-west-1 | 0.299 | 206 |
| us-west-1 | 0.265 | 3814 |
| us-west-2 | 0.301 | 167 |

