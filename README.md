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
Updated: 2026-03-29T16:27:28.483236+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.793 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.628 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.771 |  |
| ap-southeast-3 | 0.912 |  |
| ap-southeast-4 | 0.807 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.095 | 16 |
| ca-west-1 | 0.290 |  |
| eu-central-1 | 0.408 |  |
| eu-central-2 | 0.426 |  |
| eu-north-1 | 0.465 |  |
| eu-south-1 | 0.432 |  |
| eu-south-2 | 0.475 |  |
| eu-west-1 | 0.335 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.391 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.787 |  |
| me-south-1 | 0.769 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.518 |  |
| us-east-1 | 0.065 | 4392 |
| us-east-2 | 0.073 | 1464 |
| us-gov-east-1 | 0.074 | 1613 |
| us-gov-west-1 | 0.290 | 190 |
| us-west-1 | 0.230 | 3317 |
| us-west-2 | 0.290 | 152 |

