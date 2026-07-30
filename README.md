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
Updated: 2026-07-30T07:29:55.144446+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.886 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.727 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.716 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.957 |  |
| ap-southeast-1 | 0.856 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.914 |  |
| ap-southeast-4 | 0.808 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.816 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.121 | 17 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.405 |  |
| eu-central-2 | 0.428 |  |
| eu-north-1 | 0.455 |  |
| eu-south-1 | 0.430 |  |
| eu-south-2 | 0.448 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.363 |  |
| eu-west-3 | 0.395 |  |
| il-central-1 | 0.559 |  |
| me-central-1 | 0.811 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.512 |  |
| us-east-1 | 0.076 | 4922 |
| us-east-2 | 0.075 | 1672 |
| us-gov-east-1 | 0.113 | 1786 |
| us-gov-west-1 | 0.282 | 208 |
| us-west-1 | 0.233 | 3854 |
| us-west-2 | 0.284 | 171 |

