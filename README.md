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
Updated: 2026-04-06T15:39:55.665741+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.032 |  |
| ap-east-1 | 0.671 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.600 |  |
| ap-northeast-3 | 0.520 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.749 |  |
| ap-southeast-2 | 0.632 |  |
| ap-southeast-3 | 0.793 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.765 |  |
| ap-southeast-6 | 0.698 |  |
| ap-southeast-7 | 0.851 |  |
| ca-central-1 | 0.249 | 16 |
| ca-west-1 | 0.187 |  |
| eu-central-1 | 0.551 |  |
| eu-central-2 | 0.570 |  |
| eu-north-1 | 0.612 |  |
| eu-south-1 | 0.586 |  |
| eu-south-2 | 0.586 |  |
| eu-west-1 | 0.482 |  |
| eu-west-2 | 0.516 |  |
| eu-west-3 | 0.536 |  |
| il-central-1 | 0.739 |  |
| me-central-1 | 0.937 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.681 |  |
| us-east-1 | 0.209 | 4447 |
| us-east-2 | 0.180 | 1487 |
| us-gov-east-1 | 0.180 | 1630 |
| us-gov-west-1 | 0.155 | 191 |
| us-west-1 | 0.102 | 3364 |
| us-west-2 | 0.154 | 153 |

