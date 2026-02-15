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
Updated: 2026-02-15T11:17:33.884629+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.677 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.980 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.450 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.508 |  |
| eu-south-1 | 0.476 |  |
| eu-south-2 | 0.493 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.636 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.798 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.109 | 4124 |
| us-east-2 | 0.080 | 1343 |
| us-gov-east-1 | 0.089 | 1471 |
| us-gov-west-1 | 0.224 | 148 |
| us-west-1 | 0.231 | 3062 |
| us-west-2 | 0.227 | 125 |

