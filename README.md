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
Updated: 2026-06-13T09:53:05.972020+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.886 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.733 |  |
| ap-northeast-1 | 0.614 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.639 |  |
| ap-south-1 | 0.827 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.869 |  |
| ap-southeast-2 | 0.754 |  |
| ap-southeast-3 | 0.927 |  |
| ap-southeast-4 | 0.812 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.973 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.406 |  |
| eu-central-2 | 0.446 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.436 |  |
| eu-south-2 | 0.436 |  |
| eu-west-1 | 0.323 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.387 |  |
| il-central-1 | 0.559 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.507 |  |
| us-east-1 | 0.078 | 4750 |
| us-east-2 | 0.107 | 1632 |
| us-gov-east-1 | 0.112 | 1712 |
| us-gov-west-1 | 0.285 | 198 |
| us-west-1 | 0.240 | 3660 |
| us-west-2 | 0.285 | 163 |

