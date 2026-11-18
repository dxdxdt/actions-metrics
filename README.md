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
Updated: 2026-11-18T18:31:41.458518+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.744 |  |
| ap-east-1 | 0.506 |  |
| ap-east-2 | 0.460 |  |
| ap-northeast-1 | 0.372 |  |
| ap-northeast-2 | 0.455 |  |
| ap-northeast-3 | 0.392 |  |
| ap-south-1 | 0.651 |  |
| ap-south-2 | 0.660 |  |
| ap-southeast-1 | 0.567 |  |
| ap-southeast-2 | 0.510 |  |
| ap-southeast-3 | 0.606 |  |
| ap-southeast-4 | 0.569 |  |
| ap-southeast-5 | 0.576 |  |
| ap-southeast-6 | 0.527 |  |
| ap-southeast-7 | 0.639 |  |
| ca-central-1 | 0.163 | 18 |
| ca-west-1 | 0.186 |  |
| eu-central-1 | 0.392 |  |
| eu-central-2 | 0.411 |  |
| eu-north-1 | 0.420 |  |
| eu-south-1 | 0.411 |  |
| eu-south-2 | 0.401 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.371 |  |
| il-central-1 | 0.515 |  |
| me-central-1 | 0.667 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.697 |  |
| mx-central-1 | 0.193 |  |
| sa-east-1 | 0.477 |  |
| us-east-1 | 0.136 | 5189 |
| us-east-2 | 0.140 | 1730 |
| us-gov-east-1 | 0.146 | 1962 |
| us-gov-west-1 | 0.120 | 247 |
| us-west-1 | 0.124 | 4219 |
| us-west-2 | 0.120 | 199 |

