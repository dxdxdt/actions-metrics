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
Updated: 2026-04-03T14:40:36.007805+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.959 |  |
| ap-east-1 | 0.743 |  |
| ap-east-2 | 0.693 |  |
| ap-northeast-1 | 0.567 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.797 |  |
| ap-southeast-7 | 0.924 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.529 |  |
| eu-south-1 | 0.504 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.430 |  |
| eu-west-3 | 0.464 |  |
| il-central-1 | 0.660 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.572 |  |
| us-east-1 | 0.107 | 4424 |
| us-east-2 | 0.084 | 1477 |
| us-gov-east-1 | 0.091 | 1623 |
| us-gov-west-1 | 0.232 | 191 |
| us-west-1 | 0.177 | 3345 |
| us-west-2 | 0.231 | 153 |

