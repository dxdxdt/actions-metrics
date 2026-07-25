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
Updated: 2026-07-25T06:16:01.360812+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.969 |  |
| ap-east-1 | 0.720 |  |
| ap-east-2 | 0.662 |  |
| ap-northeast-1 | 0.541 |  |
| ap-northeast-2 | 0.648 |  |
| ap-northeast-3 | 0.569 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.795 |  |
| ap-southeast-2 | 0.713 |  |
| ap-southeast-3 | 0.848 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.734 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.173 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.507 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.408 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.482 |  |
| il-central-1 | 0.643 |  |
| me-central-1 | 0.860 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.600 |  |
| us-east-1 | 0.152 | 4906 |
| us-east-2 | 0.124 | 1663 |
| us-gov-east-1 | 0.128 | 1777 |
| us-gov-west-1 | 0.216 | 207 |
| us-west-1 | 0.185 | 3829 |
| us-west-2 | 0.217 | 170 |

