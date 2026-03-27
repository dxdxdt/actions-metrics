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
Updated: 2026-03-27T14:07:04.652002+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.640 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.630 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.959 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.717 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.755 |  |
| ap-southeast-7 | 0.881 |  |
| ca-central-1 | 0.188 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.582 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.579 |  |
| eu-west-1 | 0.450 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.702 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.839 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.160 | 4370 |
| us-east-2 | 0.140 | 1458 |
| us-gov-east-1 | 0.140 | 1609 |
| us-gov-west-1 | 0.199 | 190 |
| us-west-1 | 0.145 | 3307 |
| us-west-2 | 0.195 | 151 |

