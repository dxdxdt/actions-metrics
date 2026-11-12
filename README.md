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
Updated: 2026-11-12T23:01:24.931128+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.668 |  |
| ap-east-1 | 0.603 |  |
| ap-east-2 | 0.557 |  |
| ap-northeast-1 | 0.470 |  |
| ap-northeast-2 | 0.544 |  |
| ap-northeast-3 | 0.489 |  |
| ap-south-1 | 0.632 |  |
| ap-south-2 | 0.697 |  |
| ap-southeast-1 | 0.660 |  |
| ap-southeast-2 | 0.582 |  |
| ap-southeast-3 | 0.702 |  |
| ap-southeast-4 | 0.645 |  |
| ap-southeast-5 | 0.675 |  |
| ap-southeast-6 | 0.601 |  |
| ap-southeast-7 | 0.739 |  |
| ca-central-1 | 0.093 | 18 |
| ca-west-1 | 0.171 |  |
| eu-central-1 | 0.309 |  |
| eu-central-2 | 0.321 |  |
| eu-north-1 | 0.347 |  |
| eu-south-1 | 0.323 |  |
| eu-south-2 | 0.314 |  |
| eu-west-1 | 0.248 |  |
| eu-west-2 | 0.280 |  |
| eu-west-3 | 0.290 |  |
| il-central-1 | 0.426 |  |
| me-central-1 | 0.585 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.528 |  |
| mx-central-1 | 0.161 |  |
| sa-east-1 | 0.381 |  |
| us-east-1 | 0.049 | 5182 |
| us-east-2 | 0.082 | 1727 |
| us-gov-east-1 | 0.085 | 1959 |
| us-gov-west-1 | 0.231 | 245 |
| us-west-1 | 0.184 | 4216 |
| us-west-2 | 0.227 | 197 |

