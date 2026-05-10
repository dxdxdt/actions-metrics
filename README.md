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
Updated: 2026-05-10T11:43:44.763407+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.922 |  |
| ap-east-1 | 0.761 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.607 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.953 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.754 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.798 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.874 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.481 |  |
| eu-south-1 | 0.461 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.370 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.605 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.551 |  |
| us-east-1 | 0.087 | 4620 |
| us-east-2 | 0.083 | 1582 |
| us-gov-east-1 | 0.086 | 1685 |
| us-gov-west-1 | 0.269 | 195 |
| us-west-1 | 0.217 | 3547 |
| us-west-2 | 0.268 | 157 |

