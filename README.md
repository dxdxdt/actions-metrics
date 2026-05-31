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
Updated: 2026-05-31T18:03:07.739022+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.882 |  |
| ap-east-1 | 0.808 |  |
| ap-east-2 | 0.746 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.734 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.822 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.885 |  |
| ap-southeast-2 | 0.792 |  |
| ap-southeast-3 | 0.937 |  |
| ap-southeast-4 | 0.846 |  |
| ap-southeast-5 | 0.905 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.119 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.395 |  |
| eu-central-2 | 0.421 |  |
| eu-north-1 | 0.441 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.429 |  |
| eu-west-1 | 0.319 |  |
| eu-west-2 | 0.353 |  |
| eu-west-3 | 0.377 |  |
| il-central-1 | 0.550 |  |
| me-central-1 | 0.836 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.506 |  |
| us-east-1 | 0.068 | 4708 |
| us-east-2 | 0.087 | 1617 |
| us-gov-east-1 | 0.100 | 1708 |
| us-gov-west-1 | 0.302 | 195 |
| us-west-1 | 0.245 | 3625 |
| us-west-2 | 0.302 | 161 |

