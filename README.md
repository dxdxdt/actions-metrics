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
Updated: 2026-02-17T07:44:58.505572+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.725 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.532 |  |
| ap-northeast-2 | 0.638 |  |
| ap-south-1 | 0.945 |  |
| ap-south-2 | 0.984 |  |
| ap-southeast-1 | 0.781 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.840 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.802 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.519 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.535 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.458 |  |
| eu-west-3 | 0.478 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.828 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.615 |  |
| us-east-1 | 0.141 | 4134 |
| us-east-2 | 0.129 | 1349 |
| us-gov-east-1 | 0.112 | 1484 |
| us-gov-west-1 | 0.184 | 151 |
| us-west-1 | 0.198 | 3066 |
| us-west-2 | 0.184 | 126 |

