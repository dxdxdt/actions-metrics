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
Updated: 2026-04-15T23:36:24.312201+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.754 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.726 |  |
| ap-northeast-3 | 0.662 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.869 |  |
| ap-southeast-2 | 0.803 |  |
| ap-southeast-3 | 0.926 |  |
| ap-southeast-4 | 0.841 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.867 |  |
| ap-southeast-7 | 0.975 |  |
| ca-central-1 | 0.087 | 16 |
| ca-west-1 | 0.278 |  |
| eu-central-1 | 0.408 |  |
| eu-central-2 | 0.424 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.424 |  |
| eu-south-2 | 0.440 |  |
| eu-west-1 | 0.321 |  |
| eu-west-2 | 0.357 |  |
| eu-west-3 | 0.386 |  |
| il-central-1 | 0.577 |  |
| me-central-1 | 0.776 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.500 |  |
| us-east-1 | 0.058 | 4509 |
| us-east-2 | 0.077 | 1502 |
| us-gov-east-1 | 0.076 | 1650 |
| us-gov-west-1 | 0.315 | 193 |
| us-west-1 | 0.258 | 3418 |
| us-west-2 | 0.322 | 156 |

