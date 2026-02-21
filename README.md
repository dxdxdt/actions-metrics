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
Updated: 2026-02-21T09:23:13.714717+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.945 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.704 |  |
| ap-northeast-1 | 0.577 |  |
| ap-northeast-2 | 0.688 |  |
| ap-northeast-3 | 0.603 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.794 |  |
| ap-southeast-5 | 0.852 |  |
| ap-southeast-6 | 0.797 |  |
| ap-southeast-7 | 0.937 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.466 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.470 |  |
| eu-south-2 | 0.483 |  |
| eu-west-1 | 0.370 |  |
| eu-west-2 | 0.401 |  |
| eu-west-3 | 0.429 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.782 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.091 | 4157 |
| us-east-2 | 0.076 | 1360 |
| us-gov-east-1 | 0.079 | 1497 |
| us-gov-west-1 | 0.235 | 160 |
| us-west-1 | 0.230 | 3090 |
| us-west-2 | 0.251 | 129 |

