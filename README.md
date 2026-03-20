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
Updated: 2026-03-20T23:22:22.822360+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.729 |  |
| ap-east-2 | 0.667 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.671 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.745 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.183 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.462 |  |
| eu-central-2 | 0.484 |  |
| eu-north-1 | 0.520 |  |
| eu-south-1 | 0.495 |  |
| eu-south-2 | 0.497 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.425 |  |
| eu-west-3 | 0.447 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.801 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.566 |  |
| us-east-1 | 0.137 | 4318 |
| us-east-2 | 0.147 | 1443 |
| us-gov-east-1 | 0.149 | 1591 |
| us-gov-west-1 | 0.234 | 189 |
| us-west-1 | 0.186 | 3269 |
| us-west-2 | 0.233 | 148 |

