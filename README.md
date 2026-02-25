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
Updated: 2026-02-25T08:39:24.735157+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.003 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.528 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.551 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.778 |  |
| ap-southeast-2 | 0.684 |  |
| ap-southeast-3 | 0.833 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.759 |  |
| ap-southeast-7 | 0.880 |  |
| ca-central-1 | 0.179 | 16 |
| ca-west-1 | 0.192 |  |
| eu-central-1 | 0.511 |  |
| eu-central-2 | 0.518 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.520 |  |
| eu-south-2 | 0.545 |  |
| eu-west-1 | 0.438 |  |
| eu-west-2 | 0.465 |  |
| eu-west-3 | 0.497 |  |
| il-central-1 | 0.691 |  |
| me-central-1 | 0.907 |  |
| me-south-1 | 0.856 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.603 |  |
| us-east-1 | 0.150 | 4179 |
| us-east-2 | 0.137 | 1379 |
| us-gov-east-1 | 0.122 | 1508 |
| us-gov-west-1 | 0.177 | 161 |
| us-west-1 | 0.179 | 3116 |
| us-west-2 | 0.178 | 130 |

