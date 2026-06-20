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
Updated: 2026-06-20T11:10:23.584268+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.000 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.602 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.658 |  |
| ap-southeast-3 | 0.813 |  |
| ap-southeast-4 | 0.701 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.693 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.245 | 16 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.554 |  |
| eu-south-1 | 0.554 |  |
| eu-south-2 | 0.547 |  |
| eu-west-1 | 0.435 |  |
| eu-west-2 | 0.479 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.672 |  |
| me-central-1 | 0.914 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.181 | 4774 |
| us-east-2 | 0.190 | 1636 |
| us-gov-east-1 | 0.172 | 1715 |
| us-gov-west-1 | 0.181 | 198 |
| us-west-1 | 0.128 | 3685 |
| us-west-2 | 0.183 | 163 |

