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
Updated: 2026-06-03T02:57:32.240194+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.932 |  |
| ap-east-1 | 0.761 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.576 |  |
| ap-northeast-2 | 0.697 |  |
| ap-northeast-3 | 0.602 |  |
| ap-south-1 | 0.840 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.844 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.945 |  |
| ca-central-1 | 0.152 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.439 |  |
| eu-central-2 | 0.470 |  |
| eu-north-1 | 0.488 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.481 |  |
| eu-west-1 | 0.362 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.424 |  |
| il-central-1 | 0.601 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.553 |  |
| us-east-1 | 0.112 | 4714 |
| us-east-2 | 0.131 | 1621 |
| us-gov-east-1 | 0.131 | 1708 |
| us-gov-west-1 | 0.252 | 196 |
| us-west-1 | 0.219 | 3630 |
| us-west-2 | 0.267 | 162 |

