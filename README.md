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
Updated: 2026-03-22T17:20:01.860879+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.868 |  |
| ap-east-1 | 0.821 |  |
| ap-east-2 | 0.753 |  |
| ap-northeast-1 | 0.649 |  |
| ap-northeast-2 | 0.740 |  |
| ap-northeast-3 | 0.667 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.895 |  |
| ap-southeast-2 | 0.819 |  |
| ap-southeast-3 | 0.957 |  |
| ap-southeast-4 | 0.858 |  |
| ap-southeast-5 | 0.928 |  |
| ap-southeast-6 | 0.857 |  |
| ap-southeast-7 | 1.006 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.274 |  |
| eu-central-1 | 0.382 |  |
| eu-central-2 | 0.405 |  |
| eu-north-1 | 0.433 |  |
| eu-south-1 | 0.406 |  |
| eu-south-2 | 0.414 |  |
| eu-west-1 | 0.297 |  |
| eu-west-2 | 0.333 |  |
| eu-west-3 | 0.358 |  |
| il-central-1 | 0.542 |  |
| me-central-1 | 0.761 |  |
| me-south-1 | 0.714 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.472 |  |
| us-east-1 | 0.049 | 4333 |
| us-east-2 | 0.083 | 1446 |
| us-gov-east-1 | 0.093 | 1595 |
| us-gov-west-1 | 0.343 | 189 |
| us-west-1 | 0.286 | 3280 |
| us-west-2 | 0.345 | 151 |

