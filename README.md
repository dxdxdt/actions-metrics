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
Updated: 2026-03-18T07:00:32.093072+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.977 |  |
| ap-east-1 | 0.719 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.535 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.918 |  |
| ap-south-2 | 0.958 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.846 |  |
| ap-southeast-4 | 0.741 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.902 |  |
| ca-central-1 | 0.167 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.499 |  |
| eu-north-1 | 0.531 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.429 |  |
| eu-west-3 | 0.466 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.812 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.592 |  |
| us-east-1 | 0.135 | 4299 |
| us-east-2 | 0.121 | 1432 |
| us-gov-east-1 | 0.120 | 1585 |
| us-gov-west-1 | 0.190 | 189 |
| us-west-1 | 0.197 | 3249 |
| us-west-2 | 0.197 | 148 |

