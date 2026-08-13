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
Updated: 2026-08-13T10:55:23.076512+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.065 |  |
| ap-east-1 | 0.631 |  |
| ap-east-2 | 0.571 |  |
| ap-northeast-1 | 0.450 |  |
| ap-northeast-2 | 0.558 |  |
| ap-northeast-3 | 0.475 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.882 |  |
| ap-southeast-1 | 0.708 |  |
| ap-southeast-2 | 0.597 |  |
| ap-southeast-3 | 0.768 |  |
| ap-southeast-4 | 0.639 |  |
| ap-southeast-5 | 0.732 |  |
| ap-southeast-6 | 0.641 |  |
| ap-southeast-7 | 0.814 |  |
| ca-central-1 | 0.316 | 18 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.575 |  |
| eu-central-2 | 0.591 |  |
| eu-north-1 | 0.641 |  |
| eu-south-1 | 0.597 |  |
| eu-south-2 | 0.609 |  |
| eu-west-1 | 0.508 |  |
| eu-west-2 | 0.538 |  |
| eu-west-3 | 0.546 |  |
| il-central-1 | 0.734 |  |
| me-central-1 | 0.988 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.683 |  |
| us-east-1 | 0.237 | 4984 |
| us-east-2 | 0.256 | 1679 |
| us-gov-east-1 | 0.234 | 1823 |
| us-gov-west-1 | 0.149 | 222 |
| us-west-1 | 0.068 | 3938 |
| us-west-2 | 0.149 | 176 |

