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
Updated: 2026-10-16T17:07:06.975899+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.051 |  |
| ap-east-1 | 0.643 |  |
| ap-east-2 | 0.582 |  |
| ap-northeast-1 | 0.463 |  |
| ap-northeast-2 | 0.572 |  |
| ap-northeast-3 | 0.490 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.882 |  |
| ap-southeast-1 | 0.720 |  |
| ap-southeast-2 | 0.604 |  |
| ap-southeast-3 | 0.776 |  |
| ap-southeast-4 | 0.650 |  |
| ap-southeast-5 | 0.738 |  |
| ap-southeast-6 | 0.685 |  |
| ap-southeast-7 | 0.821 |  |
| ca-central-1 | 0.256 | 18 |
| ca-west-1 | 0.178 |  |
| eu-central-1 | 0.561 |  |
| eu-central-2 | 0.577 |  |
| eu-north-1 | 0.610 |  |
| eu-south-1 | 0.582 |  |
| eu-south-2 | 0.573 |  |
| eu-west-1 | 0.479 |  |
| eu-west-2 | 0.518 |  |
| eu-west-3 | 0.542 |  |
| il-central-1 | 0.720 |  |
| me-central-1 | 0.924 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.677 |  |
| us-east-1 | 0.234 | 5148 |
| us-east-2 | 0.214 | 1699 |
| us-gov-east-1 | 0.213 | 1945 |
| us-gov-west-1 | 0.135 | 238 |
| us-west-1 | 0.075 | 4173 |
| us-west-2 | 0.136 | 194 |

