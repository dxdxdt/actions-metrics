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
Updated: 2026-08-10T09:09:48.288471+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.636 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.458 |  |
| ap-northeast-2 | 0.564 |  |
| ap-northeast-3 | 0.485 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.888 |  |
| ap-southeast-1 | 0.712 |  |
| ap-southeast-2 | 0.649 |  |
| ap-southeast-3 | 0.776 |  |
| ap-southeast-4 | 0.692 |  |
| ap-southeast-5 | 0.732 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.816 |  |
| ca-central-1 | 0.256 | 18 |
| ca-west-1 | 0.154 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.568 |  |
| eu-north-1 | 0.584 |  |
| eu-south-1 | 0.575 |  |
| eu-south-2 | 0.583 |  |
| eu-west-1 | 0.479 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.529 |  |
| il-central-1 | 0.733 |  |
| me-central-1 | 0.951 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.678 |  |
| us-east-1 | 0.220 | 4965 |
| us-east-2 | 0.219 | 1678 |
| us-gov-east-1 | 0.195 | 1816 |
| us-gov-west-1 | 0.124 | 216 |
| us-west-1 | 0.137 | 3915 |
| us-west-2 | 0.125 | 176 |

