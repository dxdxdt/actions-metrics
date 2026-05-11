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
Updated: 2026-05-11T10:30:50.455226+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.918 |  |
| ap-east-1 | 0.812 |  |
| ap-east-2 | 0.715 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.686 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.848 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.876 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 0.971 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.453 |  |
| eu-north-1 | 0.472 |  |
| eu-south-1 | 0.461 |  |
| eu-south-2 | 0.457 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.388 |  |
| eu-west-3 | 0.404 |  |
| il-central-1 | 0.598 |  |
| me-central-1 | 0.826 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.539 |  |
| us-east-1 | 0.093 | 4625 |
| us-east-2 | 0.089 | 1588 |
| us-gov-east-1 | 0.104 | 1685 |
| us-gov-west-1 | 0.274 | 195 |
| us-west-1 | 0.215 | 3549 |
| us-west-2 | 0.271 | 158 |

