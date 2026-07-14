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
Updated: 2026-07-14T23:44:23.656967+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.012 |  |
| ap-east-1 | 0.682 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.501 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.529 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.758 |  |
| ap-southeast-2 | 0.649 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.689 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.678 |  |
| ap-southeast-7 | 0.858 |  |
| ca-central-1 | 0.240 | 16 |
| ca-west-1 | 0.191 |  |
| eu-central-1 | 0.528 |  |
| eu-central-2 | 0.548 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.555 |  |
| eu-south-2 | 0.578 |  |
| eu-west-1 | 0.446 |  |
| eu-west-2 | 0.485 |  |
| eu-west-3 | 0.513 |  |
| il-central-1 | 0.678 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.195 | 4871 |
| us-east-2 | 0.202 | 1656 |
| us-gov-east-1 | 0.178 | 1750 |
| us-gov-west-1 | 0.167 | 202 |
| us-west-1 | 0.119 | 3777 |
| us-west-2 | 0.166 | 166 |

