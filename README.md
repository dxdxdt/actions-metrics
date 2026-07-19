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
Updated: 2026-07-19T22:43:14.137222+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.042 |  |
| ap-east-1 | 0.641 |  |
| ap-east-2 | 0.580 |  |
| ap-northeast-1 | 0.458 |  |
| ap-northeast-2 | 0.569 |  |
| ap-northeast-3 | 0.486 |  |
| ap-south-1 | 0.933 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.731 |  |
| ap-southeast-2 | 0.608 |  |
| ap-southeast-3 | 0.782 |  |
| ap-southeast-4 | 0.659 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.657 |  |
| ap-southeast-7 | 0.829 |  |
| ca-central-1 | 0.297 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.552 |  |
| eu-central-2 | 0.584 |  |
| eu-north-1 | 0.593 |  |
| eu-south-1 | 0.585 |  |
| eu-south-2 | 0.587 |  |
| eu-west-1 | 0.483 |  |
| eu-west-2 | 0.521 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.700 |  |
| me-central-1 | 0.969 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.217 | 4886 |
| us-east-2 | 0.240 | 1657 |
| us-gov-east-1 | 0.215 | 1770 |
| us-gov-west-1 | 0.152 | 205 |
| us-west-1 | 0.091 | 3808 |
| us-west-2 | 0.151 | 167 |

