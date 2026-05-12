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
Updated: 2026-05-12T20:27:21.102465+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.039 |  |
| ap-east-1 | 0.657 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.477 |  |
| ap-northeast-2 | 0.586 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.912 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.625 |  |
| ap-southeast-3 | 0.785 |  |
| ap-southeast-4 | 0.659 |  |
| ap-southeast-5 | 0.787 |  |
| ap-southeast-6 | 0.658 |  |
| ap-southeast-7 | 0.838 |  |
| ca-central-1 | 0.264 | 16 |
| ca-west-1 | 0.189 |  |
| eu-central-1 | 0.573 |  |
| eu-central-2 | 0.604 |  |
| eu-north-1 | 0.612 |  |
| eu-south-1 | 0.601 |  |
| eu-south-2 | 0.589 |  |
| eu-west-1 | 0.490 |  |
| eu-west-2 | 0.510 |  |
| eu-west-3 | 0.539 |  |
| il-central-1 | 0.717 |  |
| me-central-1 | 0.958 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.708 |  |
| us-east-1 | 0.229 | 4630 |
| us-east-2 | 0.191 | 1589 |
| us-gov-east-1 | 0.197 | 1687 |
| us-gov-west-1 | 0.145 | 195 |
| us-west-1 | 0.087 | 3556 |
| us-west-2 | 0.146 | 158 |

