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
Updated: 2026-03-21T20:18:23.729908+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.967 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.677 |  |
| ap-northeast-1 | 0.552 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.577 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.723 |  |
| ap-southeast-3 | 0.856 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.829 |  |
| ap-southeast-6 | 0.797 |  |
| ap-southeast-7 | 0.908 |  |
| ca-central-1 | 0.137 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.488 |  |
| eu-north-1 | 0.526 |  |
| eu-south-1 | 0.496 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.434 |  |
| eu-west-3 | 0.451 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.856 |  |
| me-south-1 | 0.812 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.116 | 4322 |
| us-east-2 | 0.100 | 1446 |
| us-gov-east-1 | 0.096 | 1594 |
| us-gov-west-1 | 0.208 | 189 |
| us-west-1 | 0.201 | 3274 |
| us-west-2 | 0.205 | 151 |

