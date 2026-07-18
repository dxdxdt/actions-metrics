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
Updated: 2026-07-18T20:00:28.096222+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.800 |  |
| ap-east-2 | 0.739 |  |
| ap-northeast-1 | 0.623 |  |
| ap-northeast-2 | 0.727 |  |
| ap-northeast-3 | 0.648 |  |
| ap-south-1 | 0.831 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.764 |  |
| ap-southeast-3 | 0.926 |  |
| ap-southeast-4 | 0.819 |  |
| ap-southeast-5 | 0.911 |  |
| ap-southeast-6 | 0.812 |  |
| ap-southeast-7 | 0.987 |  |
| ca-central-1 | 0.130 | 16 |
| ca-west-1 | 0.280 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.428 |  |
| eu-north-1 | 0.452 |  |
| eu-south-1 | 0.425 |  |
| eu-south-2 | 0.443 |  |
| eu-west-1 | 0.327 |  |
| eu-west-2 | 0.365 |  |
| eu-west-3 | 0.385 |  |
| il-central-1 | 0.562 |  |
| me-central-1 | 0.790 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.505 |  |
| us-east-1 | 0.070 | 4882 |
| us-east-2 | 0.098 | 1657 |
| us-gov-east-1 | 0.104 | 1767 |
| us-gov-west-1 | 0.293 | 203 |
| us-west-1 | 0.240 | 3799 |
| us-west-2 | 0.299 | 167 |

