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
Updated: 2026-07-18T10:12:24.550433+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.740 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.565 |  |
| ap-northeast-2 | 0.662 |  |
| ap-northeast-3 | 0.574 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.870 |  |
| ap-southeast-1 | 0.803 |  |
| ap-southeast-2 | 0.694 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.834 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.200 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.495 |  |
| eu-north-1 | 0.515 |  |
| eu-south-1 | 0.500 |  |
| eu-south-2 | 0.495 |  |
| eu-west-1 | 0.390 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.443 |  |
| il-central-1 | 0.624 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.580 |  |
| us-east-1 | 0.146 | 4878 |
| us-east-2 | 0.160 | 1657 |
| us-gov-east-1 | 0.158 | 1766 |
| us-gov-west-1 | 0.234 | 203 |
| us-west-1 | 0.177 | 3797 |
| us-west-2 | 0.234 | 166 |

