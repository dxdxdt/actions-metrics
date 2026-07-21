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
Updated: 2026-07-21T08:11:20.827341+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.936 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.677 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.660 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.862 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.830 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.176 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.501 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.408 |  |
| eu-west-3 | 0.444 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.127 | 4892 |
| us-east-2 | 0.145 | 1658 |
| us-gov-east-1 | 0.140 | 1771 |
| us-gov-west-1 | 0.236 | 206 |
| us-west-1 | 0.220 | 3813 |
| us-west-2 | 0.234 | 167 |

