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
Updated: 2026-07-26T10:37:46.164122+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.959 |  |
| ap-east-1 | 0.710 |  |
| ap-east-2 | 0.652 |  |
| ap-northeast-1 | 0.523 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.793 |  |
| ap-southeast-2 | 0.679 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.723 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.231 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.490 |  |
| eu-central-2 | 0.515 |  |
| eu-north-1 | 0.547 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.523 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.603 |  |
| us-east-1 | 0.161 | 4912 |
| us-east-2 | 0.181 | 1665 |
| us-gov-east-1 | 0.171 | 1778 |
| us-gov-west-1 | 0.217 | 207 |
| us-west-1 | 0.152 | 3836 |
| us-west-2 | 0.216 | 170 |

