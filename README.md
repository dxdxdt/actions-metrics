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
Updated: 2026-04-12T19:34:48.823758+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.005 |  |
| ap-east-1 | 0.705 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.630 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.694 |  |
| ap-southeast-3 | 0.838 |  |
| ap-southeast-4 | 0.727 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.778 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.428 |  |
| eu-west-2 | 0.470 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.135 | 4488 |
| us-east-2 | 0.125 | 1497 |
| us-gov-east-1 | 0.114 | 1646 |
| us-gov-west-1 | 0.206 | 192 |
| us-west-1 | 0.151 | 3402 |
| us-west-2 | 0.208 | 155 |

