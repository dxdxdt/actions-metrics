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
Updated: 2026-05-24T17:56:32.434836+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.739 |  |
| ap-east-2 | 0.686 |  |
| ap-northeast-1 | 0.570 |  |
| ap-northeast-2 | 0.688 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.846 |  |
| ap-south-2 | 0.870 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.797 |  |
| ap-southeast-5 | 0.834 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.932 |  |
| ca-central-1 | 0.166 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.467 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.410 |  |
| eu-west-3 | 0.436 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.560 |  |
| us-east-1 | 0.121 | 4685 |
| us-east-2 | 0.126 | 1611 |
| us-gov-east-1 | 0.128 | 1704 |
| us-gov-west-1 | 0.251 | 195 |
| us-west-1 | 0.210 | 3594 |
| us-west-2 | 0.249 | 160 |

