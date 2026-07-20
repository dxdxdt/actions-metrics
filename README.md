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
Updated: 2026-07-20T09:52:00.890193+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.674 |  |
| ap-northeast-1 | 0.556 |  |
| ap-northeast-2 | 0.668 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.862 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.830 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.196 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.505 |  |
| eu-south-1 | 0.493 |  |
| eu-south-2 | 0.503 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.445 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.127 | 4888 |
| us-east-2 | 0.149 | 1657 |
| us-gov-east-1 | 0.150 | 1770 |
| us-gov-west-1 | 0.227 | 205 |
| us-west-1 | 0.172 | 3810 |
| us-west-2 | 0.226 | 167 |

