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
Updated: 2026-05-09T21:36:54.204210+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.662 |  |
| ap-east-2 | 0.597 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.589 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.934 |  |
| ap-south-2 | 0.937 |  |
| ap-southeast-1 | 0.737 |  |
| ap-southeast-2 | 0.646 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.678 |  |
| ap-southeast-5 | 0.760 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.835 |  |
| ca-central-1 | 0.245 | 16 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.540 |  |
| eu-central-2 | 0.568 |  |
| eu-north-1 | 0.582 |  |
| eu-south-1 | 0.569 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.525 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.656 |  |
| us-east-1 | 0.202 | 4617 |
| us-east-2 | 0.161 | 1580 |
| us-gov-east-1 | 0.169 | 1683 |
| us-gov-west-1 | 0.155 | 195 |
| us-west-1 | 0.100 | 3547 |
| us-west-2 | 0.155 | 157 |

