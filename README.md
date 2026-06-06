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
Updated: 2026-06-06T21:59:07.202268+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.642 |  |
| ap-northeast-3 | 0.567 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.695 |  |
| ap-southeast-3 | 0.854 |  |
| ap-southeast-4 | 0.727 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.896 |  |
| ca-central-1 | 0.180 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.518 |  |
| eu-north-1 | 0.537 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.648 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.146 | 4729 |
| us-east-2 | 0.115 | 1627 |
| us-gov-east-1 | 0.123 | 1709 |
| us-gov-west-1 | 0.208 | 197 |
| us-west-1 | 0.153 | 3639 |
| us-west-2 | 0.208 | 162 |

