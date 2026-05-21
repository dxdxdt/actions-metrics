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
Updated: 2026-05-21T02:36:07.437855+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.814 |  |
| ap-east-2 | 0.761 |  |
| ap-northeast-1 | 0.620 |  |
| ap-northeast-2 | 0.760 |  |
| ap-northeast-3 | 0.655 |  |
| ap-south-1 | 0.815 |  |
| ap-south-2 | 0.880 |  |
| ap-southeast-1 | 0.902 |  |
| ap-southeast-2 | 0.773 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.814 |  |
| ap-southeast-5 | 0.908 |  |
| ap-southeast-6 | 0.813 |  |
| ap-southeast-7 | 0.992 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.395 |  |
| eu-central-2 | 0.414 |  |
| eu-north-1 | 0.435 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.421 |  |
| eu-west-1 | 0.315 |  |
| eu-west-2 | 0.347 |  |
| eu-west-3 | 0.374 |  |
| il-central-1 | 0.552 |  |
| me-central-1 | 0.801 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.497 |  |
| us-east-1 | 0.064 | 4671 |
| us-east-2 | 0.105 | 1603 |
| us-gov-east-1 | 0.104 | 1699 |
| us-gov-west-1 | 0.304 | 195 |
| us-west-1 | 0.246 | 3582 |
| us-west-2 | 0.308 | 158 |

