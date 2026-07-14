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
Updated: 2026-07-14T20:52:32.202332+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.038 |  |
| ap-east-1 | 0.636 |  |
| ap-east-2 | 0.580 |  |
| ap-northeast-1 | 0.459 |  |
| ap-northeast-2 | 0.566 |  |
| ap-northeast-3 | 0.486 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.878 |  |
| ap-southeast-1 | 0.714 |  |
| ap-southeast-2 | 0.632 |  |
| ap-southeast-3 | 0.764 |  |
| ap-southeast-4 | 0.675 |  |
| ap-southeast-5 | 0.731 |  |
| ap-southeast-6 | 0.655 |  |
| ap-southeast-7 | 0.816 |  |
| ca-central-1 | 0.276 | 16 |
| ca-west-1 | 0.170 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.580 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.586 |  |
| eu-south-2 | 0.601 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.509 |  |
| eu-west-3 | 0.537 |  |
| il-central-1 | 0.719 |  |
| me-central-1 | 0.930 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.255 |  |
| sa-east-1 | 0.682 |  |
| us-east-1 | 0.237 | 4870 |
| us-east-2 | 0.245 | 1656 |
| us-gov-east-1 | 0.209 | 1749 |
| us-gov-west-1 | 0.121 | 202 |
| us-west-1 | 0.115 | 3776 |
| us-west-2 | 0.119 | 166 |

