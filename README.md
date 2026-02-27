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
Updated: 2026-02-27T05:46:01.114994+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.951 |  |
| ap-east-1 | 0.746 |  |
| ap-east-2 | 0.690 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.690 |  |
| ap-northeast-3 | 0.596 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.771 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.825 |  |
| ap-southeast-7 | 0.918 |  |
| ca-central-1 | 0.179 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.471 |  |
| eu-north-1 | 0.489 |  |
| eu-south-1 | 0.481 |  |
| eu-south-2 | 0.485 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.400 |  |
| eu-west-3 | 0.429 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.830 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.254 |  |
| sa-east-1 | 0.551 |  |
| us-east-1 | 0.118 | 4193 |
| us-east-2 | 0.139 | 1381 |
| us-gov-east-1 | 0.140 | 1513 |
| us-gov-west-1 | 0.263 | 162 |
| us-west-1 | 0.200 | 3128 |
| us-west-2 | 0.262 | 132 |

