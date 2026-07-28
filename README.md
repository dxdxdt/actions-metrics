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
Updated: 2026-07-28T22:09:22.665629+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.862 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.800 |  |
| ap-southeast-2 | 0.685 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.822 |  |
| ap-southeast-6 | 0.734 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.210 | 17 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.475 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.397 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.461 |  |
| il-central-1 | 0.631 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.589 |  |
| us-east-1 | 0.149 | 4917 |
| us-east-2 | 0.157 | 1670 |
| us-gov-east-1 | 0.162 | 1782 |
| us-gov-west-1 | 0.220 | 207 |
| us-west-1 | 0.173 | 3850 |
| us-west-2 | 0.221 | 171 |

