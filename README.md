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
Updated: 2026-04-22T19:03:00.209356+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.989 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.632 |  |
| ap-northeast-1 | 0.515 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.540 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.938 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.676 |  |
| ap-southeast-3 | 0.840 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.795 |  |
| ap-southeast-6 | 0.734 |  |
| ap-southeast-7 | 0.881 |  |
| ca-central-1 | 0.222 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.507 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.530 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.433 |  |
| eu-west-2 | 0.466 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.701 |  |
| me-central-1 | 0.860 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.162 | 4543 |
| us-east-2 | 0.184 | 1524 |
| us-gov-east-1 | 0.166 | 1661 |
| us-gov-west-1 | 0.204 | 194 |
| us-west-1 | 0.151 | 3460 |
| us-west-2 | 0.203 | 157 |

