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
Updated: 2026-04-29T23:46:46.990134+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.713 |  |
| ap-east-2 | 0.650 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.642 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.794 |  |
| ap-southeast-2 | 0.701 |  |
| ap-southeast-3 | 0.844 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.764 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.167 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.485 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.406 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.464 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.856 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.135 | 4576 |
| us-east-2 | 0.120 | 1548 |
| us-gov-east-1 | 0.119 | 1667 |
| us-gov-west-1 | 0.227 | 194 |
| us-west-1 | 0.160 | 3502 |
| us-west-2 | 0.220 | 157 |

