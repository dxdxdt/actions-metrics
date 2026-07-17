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
Updated: 2026-07-17T01:56:02.944684+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.672 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.521 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.805 |  |
| ap-southeast-4 | 0.682 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.680 |  |
| ap-southeast-7 | 0.850 |  |
| ca-central-1 | 0.238 | 16 |
| ca-west-1 | 0.178 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.563 |  |
| eu-north-1 | 0.590 |  |
| eu-south-1 | 0.565 |  |
| eu-south-2 | 0.599 |  |
| eu-west-1 | 0.461 |  |
| eu-west-2 | 0.494 |  |
| eu-west-3 | 0.510 |  |
| il-central-1 | 0.724 |  |
| me-central-1 | 0.898 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.652 |  |
| us-east-1 | 0.194 | 4874 |
| us-east-2 | 0.193 | 1656 |
| us-gov-east-1 | 0.165 | 1761 |
| us-gov-west-1 | 0.159 | 202 |
| us-west-1 | 0.101 | 3790 |
| us-west-2 | 0.159 | 166 |

