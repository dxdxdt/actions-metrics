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
Updated: 2026-06-20T17:17:54.940188+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.928 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.692 |  |
| ap-northeast-3 | 0.615 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.864 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.719 |  |
| ap-southeast-3 | 0.896 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.860 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.948 |  |
| ca-central-1 | 0.185 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.497 |  |
| eu-south-1 | 0.493 |  |
| eu-south-2 | 0.487 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.408 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.842 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.554 |  |
| us-east-1 | 0.123 | 4776 |
| us-east-2 | 0.147 | 1636 |
| us-gov-east-1 | 0.148 | 1715 |
| us-gov-west-1 | 0.245 | 198 |
| us-west-1 | 0.195 | 3686 |
| us-west-2 | 0.243 | 163 |

