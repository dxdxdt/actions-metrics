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
Updated: 2026-04-17T16:46:36.514032+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.628 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.842 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.893 |  |
| ap-southeast-4 | 0.799 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.826 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.451 |  |
| eu-central-2 | 0.461 |  |
| eu-north-1 | 0.495 |  |
| eu-south-1 | 0.463 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.374 |  |
| eu-west-2 | 0.405 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.823 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.549 |  |
| us-east-1 | 0.092 | 4517 |
| us-east-2 | 0.071 | 1509 |
| us-gov-east-1 | 0.079 | 1652 |
| us-gov-west-1 | 0.269 | 193 |
| us-west-1 | 0.216 | 3425 |
| us-west-2 | 0.270 | 156 |

