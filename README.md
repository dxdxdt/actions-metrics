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
Updated: 2026-03-10T14:43:55.526971+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.938 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.715 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.979 |  |
| ap-southeast-1 | 0.851 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.898 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.880 |  |
| ap-southeast-7 | 0.944 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.460 |  |
| eu-north-1 | 0.503 |  |
| eu-south-1 | 0.466 |  |
| eu-south-2 | 0.485 |  |
| eu-west-1 | 0.374 |  |
| eu-west-2 | 0.404 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.611 |  |
| me-central-1 | 0.797 |  |
| me-south-1 | 0.784 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.555 |  |
| us-east-1 | 0.085 | 4253 |
| us-east-2 | 0.068 | 1416 |
| us-gov-east-1 | 0.067 | 1554 |
| us-gov-west-1 | 0.253 | 177 |
| us-west-1 | 0.258 | 3205 |
| us-west-2 | 0.247 | 144 |

