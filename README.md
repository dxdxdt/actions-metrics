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
Updated: 2026-09-06T00:26:26.356517+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.654 |  |
| ap-east-2 | 0.590 |  |
| ap-northeast-1 | 0.472 |  |
| ap-northeast-2 | 0.573 |  |
| ap-northeast-3 | 0.498 |  |
| ap-south-1 | 0.929 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.761 |  |
| ap-southeast-2 | 0.627 |  |
| ap-southeast-3 | 0.782 |  |
| ap-southeast-4 | 0.675 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.844 |  |
| ca-central-1 | 0.274 | 18 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.546 |  |
| eu-north-1 | 0.590 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.561 |  |
| eu-west-1 | 0.457 |  |
| eu-west-2 | 0.490 |  |
| eu-west-3 | 0.507 |  |
| il-central-1 | 0.691 |  |
| me-central-1 | 0.931 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.201 | 5085 |
| us-east-2 | 0.219 | 1685 |
| us-gov-east-1 | 0.206 | 1898 |
| us-gov-west-1 | 0.167 | 231 |
| us-west-1 | 0.101 | 4085 |
| us-west-2 | 0.167 | 192 |

