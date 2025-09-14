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
Updated: 2025-09-14T18:15:11.773768+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.059 |  |
| ap-east-1 | 0.655 |  |
| ap-northeast-1 | 0.458 |  |
| ap-northeast-2 | 0.561 |  |
| ap-south-1 | 0.998 |  |
| ap-southeast-1 | 0.716 |  |
| ap-southeast-2 | 0.599 |  |
| ca-central-1 | 0.290 | 14 |
| eu-central-1 | 0.585 |  |
| eu-north-1 | 0.623 |  |
| eu-south-1 | 0.589 |  |
| eu-west-1 | 0.491 |  |
| eu-west-2 | 0.534 |  |
| eu-west-3 | 0.557 |  |
| me-south-1 | 0.915 |  |
| sa-east-1 | 0.689 |  |
| us-east-1 | 0.248 | 3071 |
| us-east-2 | 0.274 | 804 |
| us-gov-east-1 | 0.213 | 940 |
| us-gov-west-1 | 0.119 | 19 |
| us-west-1 | 0.081 | 2045 |
| us-west-2 | 0.120 | 6 |

