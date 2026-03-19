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
Updated: 2026-03-19T12:43:52.983358+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.713 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.535 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.755 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.795 |  |
| ap-southeast-7 | 0.904 |  |
| ca-central-1 | 0.164 | 16 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.498 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.543 |  |
| eu-south-1 | 0.521 |  |
| eu-south-2 | 0.533 |  |
| eu-west-1 | 0.419 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.478 |  |
| il-central-1 | 0.662 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.824 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.132 | 4309 |
| us-east-2 | 0.128 | 1437 |
| us-gov-east-1 | 0.128 | 1587 |
| us-gov-west-1 | 0.219 | 189 |
| us-west-1 | 0.171 | 3257 |
| us-west-2 | 0.212 | 148 |

