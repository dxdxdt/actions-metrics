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
Updated: 2026-03-20T13:57:07.966857+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.628 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.727 |  |
| ap-southeast-5 | 0.803 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.894 |  |
| ca-central-1 | 0.209 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.498 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.554 |  |
| eu-south-1 | 0.529 |  |
| eu-south-2 | 0.540 |  |
| eu-west-1 | 0.430 |  |
| eu-west-2 | 0.461 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.675 |  |
| me-central-1 | 0.884 |  |
| me-south-1 | 0.837 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.151 | 4314 |
| us-east-2 | 0.147 | 1439 |
| us-gov-east-1 | 0.148 | 1591 |
| us-gov-west-1 | 0.211 | 189 |
| us-west-1 | 0.168 | 3267 |
| us-west-2 | 0.201 | 148 |

