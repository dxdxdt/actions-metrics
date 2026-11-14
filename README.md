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
Updated: 2026-11-14T20:16:10.503431+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.698 |  |
| ap-east-1 | 0.564 |  |
| ap-east-2 | 0.518 |  |
| ap-northeast-1 | 0.430 |  |
| ap-northeast-2 | 0.504 |  |
| ap-northeast-3 | 0.448 |  |
| ap-south-1 | 0.659 |  |
| ap-south-2 | 0.715 |  |
| ap-southeast-1 | 0.619 |  |
| ap-southeast-2 | 0.548 |  |
| ap-southeast-3 | 0.661 |  |
| ap-southeast-4 | 0.609 |  |
| ap-southeast-5 | 0.632 |  |
| ap-southeast-6 | 0.567 |  |
| ap-southeast-7 | 0.695 |  |
| ca-central-1 | 0.102 | 18 |
| ca-west-1 | 0.146 |  |
| eu-central-1 | 0.335 |  |
| eu-central-2 | 0.348 |  |
| eu-north-1 | 0.369 |  |
| eu-south-1 | 0.351 |  |
| eu-south-2 | 0.342 |  |
| eu-west-1 | 0.273 |  |
| eu-west-2 | 0.296 |  |
| eu-west-3 | 0.319 |  |
| il-central-1 | 0.451 |  |
| me-central-1 | 0.598 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.637 |  |
| mx-central-1 | 0.163 |  |
| sa-east-1 | 0.416 |  |
| us-east-1 | 0.075 | 5185 |
| us-east-2 | 0.078 | 1727 |
| us-gov-east-1 | 0.078 | 1961 |
| us-gov-west-1 | 0.187 | 247 |
| us-west-1 | 0.151 | 4216 |
| us-west-2 | 0.185 | 197 |

