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
Updated: 2026-04-18T08:40:56.670534+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.000 |  |
| ap-east-1 | 0.694 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.621 |  |
| ap-northeast-3 | 0.538 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.665 |  |
| ap-southeast-3 | 0.818 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.725 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.232 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.523 |  |
| eu-central-2 | 0.535 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.540 |  |
| eu-south-2 | 0.543 |  |
| eu-west-1 | 0.428 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.686 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.634 |  |
| us-east-1 | 0.182 | 4520 |
| us-east-2 | 0.159 | 1510 |
| us-gov-east-1 | 0.198 | 1655 |
| us-gov-west-1 | 0.180 | 194 |
| us-west-1 | 0.124 | 3429 |
| us-west-2 | 0.182 | 156 |

