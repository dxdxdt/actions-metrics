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
Updated: 2026-04-02T11:40:47.700576+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.012 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.636 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.931 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.675 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.791 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.880 |  |
| ca-central-1 | 0.180 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.558 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.557 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.484 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.687 |  |
| me-central-1 | 0.899 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.201 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.162 | 4418 |
| us-east-2 | 0.132 | 1473 |
| us-gov-east-1 | 0.145 | 1621 |
| us-gov-west-1 | 0.185 | 190 |
| us-west-1 | 0.134 | 3336 |
| us-west-2 | 0.185 | 153 |

