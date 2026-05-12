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
Updated: 2026-05-12T23:53:28.938976+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.044 |  |
| ap-east-1 | 0.660 |  |
| ap-east-2 | 0.605 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.591 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.627 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.667 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.655 |  |
| ap-southeast-7 | 0.840 |  |
| ca-central-1 | 0.254 | 16 |
| ca-west-1 | 0.187 |  |
| eu-central-1 | 0.573 |  |
| eu-central-2 | 0.585 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.597 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.495 |  |
| eu-west-2 | 0.516 |  |
| eu-west-3 | 0.528 |  |
| il-central-1 | 0.744 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.690 |  |
| us-east-1 | 0.212 | 4630 |
| us-east-2 | 0.180 | 1590 |
| us-gov-east-1 | 0.186 | 1687 |
| us-gov-west-1 | 0.148 | 195 |
| us-west-1 | 0.096 | 3557 |
| us-west-2 | 0.146 | 158 |

