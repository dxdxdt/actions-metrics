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
Updated: 2026-02-23T11:35:26.234798+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.024 |  |
| ap-east-1 | 0.665 |  |
| ap-east-2 | 0.599 |  |
| ap-northeast-1 | 0.478 |  |
| ap-northeast-2 | 0.583 |  |
| ap-northeast-3 | 0.502 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.884 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.630 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.671 |  |
| ap-southeast-5 | 0.753 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.835 |  |
| ca-central-1 | 0.263 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.545 |  |
| eu-central-2 | 0.571 |  |
| eu-north-1 | 0.587 |  |
| eu-south-1 | 0.589 |  |
| eu-south-2 | 0.585 |  |
| eu-west-1 | 0.479 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.530 |  |
| il-central-1 | 0.750 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.893 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.657 |  |
| us-east-1 | 0.204 | 4170 |
| us-east-2 | 0.194 | 1371 |
| us-gov-east-1 | 0.192 | 1502 |
| us-gov-west-1 | 0.157 | 160 |
| us-west-1 | 0.107 | 3103 |
| us-west-2 | 0.164 | 130 |

