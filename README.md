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
Updated: 2026-03-30T13:00:21.410221+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.691 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.526 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.824 |  |
| ap-southeast-4 | 0.774 |  |
| ap-southeast-5 | 0.786 |  |
| ap-southeast-6 | 0.710 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.239 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.503 |  |
| eu-central-2 | 0.557 |  |
| eu-north-1 | 0.569 |  |
| eu-south-1 | 0.540 |  |
| eu-south-2 | 0.540 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.492 |  |
| eu-west-3 | 0.486 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.823 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.172 | 4398 |
| us-east-2 | 0.173 | 1466 |
| us-gov-east-1 | 0.182 | 1615 |
| us-gov-west-1 | 0.201 | 190 |
| us-west-1 | 0.144 | 3321 |
| us-west-2 | 0.201 | 152 |

