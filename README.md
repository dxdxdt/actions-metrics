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
Updated: 2026-03-09T19:36:06.751049+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.045 |  |
| ap-east-1 | 0.659 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.592 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.736 |  |
| ap-southeast-2 | 0.627 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.667 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.700 |  |
| ap-southeast-7 | 0.840 |  |
| ca-central-1 | 0.244 | 16 |
| ca-west-1 | 0.181 |  |
| eu-central-1 | 0.569 |  |
| eu-central-2 | 0.581 |  |
| eu-north-1 | 0.602 |  |
| eu-south-1 | 0.578 |  |
| eu-south-2 | 0.602 |  |
| eu-west-1 | 0.484 |  |
| eu-west-2 | 0.508 |  |
| eu-west-3 | 0.526 |  |
| il-central-1 | 0.737 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.895 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.666 |  |
| us-east-1 | 0.215 | 4249 |
| us-east-2 | 0.196 | 1412 |
| us-gov-east-1 | 0.182 | 1549 |
| us-gov-west-1 | 0.140 | 176 |
| us-west-1 | 0.109 | 3203 |
| us-west-2 | 0.142 | 144 |

