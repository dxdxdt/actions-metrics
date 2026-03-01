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
Updated: 2026-03-01T10:18:17.241317+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.882 |  |
| ap-east-1 | 0.794 |  |
| ap-east-2 | 0.728 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.723 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.848 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.867 |  |
| ap-southeast-2 | 0.789 |  |
| ap-southeast-3 | 0.924 |  |
| ap-southeast-4 | 0.825 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.815 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.116 | 16 |
| ca-west-1 | 0.278 |  |
| eu-central-1 | 0.394 |  |
| eu-central-2 | 0.414 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.425 |  |
| eu-south-2 | 0.426 |  |
| eu-west-1 | 0.318 |  |
| eu-west-2 | 0.354 |  |
| eu-west-3 | 0.371 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.770 |  |
| me-south-1 | 0.736 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.503 |  |
| us-east-1 | 0.067 | 4204 |
| us-east-2 | 0.090 | 1387 |
| us-gov-east-1 | 0.104 | 1519 |
| us-gov-west-1 | 0.289 | 166 |
| us-west-1 | 0.249 | 3146 |
| us-west-2 | 0.291 | 135 |

