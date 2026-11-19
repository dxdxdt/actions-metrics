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
Updated: 2026-11-19T00:52:14.600350+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.740 |  |
| ap-east-1 | 0.504 |  |
| ap-east-2 | 0.462 |  |
| ap-northeast-1 | 0.372 |  |
| ap-northeast-2 | 0.455 |  |
| ap-northeast-3 | 0.391 |  |
| ap-south-1 | 0.693 |  |
| ap-south-2 | 0.709 |  |
| ap-southeast-1 | 0.564 |  |
| ap-southeast-2 | 0.500 |  |
| ap-southeast-3 | 0.603 |  |
| ap-southeast-4 | 0.561 |  |
| ap-southeast-5 | 0.575 |  |
| ap-southeast-6 | 0.516 |  |
| ap-southeast-7 | 0.637 |  |
| ca-central-1 | 0.162 | 18 |
| ca-west-1 | 0.195 |  |
| eu-central-1 | 0.390 |  |
| eu-central-2 | 0.408 |  |
| eu-north-1 | 0.423 |  |
| eu-south-1 | 0.409 |  |
| eu-south-2 | 0.401 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.356 |  |
| eu-west-3 | 0.380 |  |
| il-central-1 | 0.514 |  |
| me-central-1 | 0.657 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.700 |  |
| mx-central-1 | 0.164 |  |
| sa-east-1 | 0.485 |  |
| us-east-1 | 0.143 | 5189 |
| us-east-2 | 0.121 | 1730 |
| us-gov-east-1 | 0.144 | 1962 |
| us-gov-west-1 | 0.122 | 247 |
| us-west-1 | 0.105 | 4220 |
| us-west-2 | 0.122 | 199 |

