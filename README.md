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
Updated: 2026-02-18T20:30:55.984083+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.019 |  |
| ap-east-1 | 0.681 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.607 |  |
| ap-northeast-3 | 0.530 |  |
| ap-south-1 | 0.981 |  |
| ap-south-2 | 0.986 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.672 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.713 |  |
| ap-southeast-5 | 0.777 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.220 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.509 |  |
| eu-central-2 | 0.541 |  |
| eu-north-1 | 0.572 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.557 |  |
| eu-west-1 | 0.428 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.508 |  |
| il-central-1 | 0.702 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.855 |  |
| mx-central-1 | 0.201 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.175 | 4139 |
| us-east-2 | 0.147 | 1354 |
| us-gov-east-1 | 0.143 | 1491 |
| us-gov-west-1 | 0.161 | 155 |
| us-west-1 | 0.170 | 3075 |
| us-west-2 | 0.160 | 128 |

