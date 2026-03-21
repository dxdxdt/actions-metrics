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
Updated: 2026-03-21T12:32:11.724171+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.959 |  |
| ap-east-1 | 0.737 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.672 |  |
| ap-northeast-3 | 0.586 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.809 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.868 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.830 |  |
| ap-southeast-6 | 0.801 |  |
| ap-southeast-7 | 0.906 |  |
| ca-central-1 | 0.183 | 16 |
| ca-west-1 | 0.283 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.503 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.433 |  |
| il-central-1 | 0.624 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.778 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.567 |  |
| us-east-1 | 0.129 | 4322 |
| us-east-2 | 0.148 | 1445 |
| us-gov-east-1 | 0.124 | 1591 |
| us-gov-west-1 | 0.228 | 189 |
| us-west-1 | 0.213 | 3271 |
| us-west-2 | 0.229 | 150 |

