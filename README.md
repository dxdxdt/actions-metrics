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
Updated: 2026-06-13T21:05:20.336167+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.880 |  |
| ap-east-1 | 0.817 |  |
| ap-east-2 | 0.753 |  |
| ap-northeast-1 | 0.641 |  |
| ap-northeast-2 | 0.743 |  |
| ap-northeast-3 | 0.665 |  |
| ap-south-1 | 0.817 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.892 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.942 |  |
| ap-southeast-4 | 0.830 |  |
| ap-southeast-5 | 0.911 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.993 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.391 |  |
| eu-central-2 | 0.414 |  |
| eu-north-1 | 0.435 |  |
| eu-south-1 | 0.414 |  |
| eu-south-2 | 0.419 |  |
| eu-west-1 | 0.308 |  |
| eu-west-2 | 0.343 |  |
| eu-west-3 | 0.366 |  |
| il-central-1 | 0.541 |  |
| me-central-1 | 0.746 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.492 |  |
| us-east-1 | 0.060 | 4754 |
| us-east-2 | 0.092 | 1633 |
| us-gov-east-1 | 0.093 | 1712 |
| us-gov-west-1 | 0.320 | 198 |
| us-west-1 | 0.253 | 3661 |
| us-west-2 | 0.308 | 163 |

