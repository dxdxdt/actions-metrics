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
Updated: 2025-12-19T10:15:16.529883+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.781 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.718 |  |
| ap-south-1 | 0.851 |  |
| ap-southeast-1 | 0.857 |  |
| ap-southeast-2 | 0.748 |  |
| ca-central-1 | 0.129 | 15 |
| eu-central-1 | 0.451 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.476 |  |
| eu-west-1 | 0.374 |  |
| eu-west-2 | 0.403 |  |
| eu-west-3 | 0.428 |  |
| me-south-1 | 0.776 |  |
| sa-east-1 | 0.559 |  |
| us-east-1 | 0.103 | 3744 |
| us-east-2 | 0.088 | 1164 |
| us-gov-east-1 | 0.093 | 1276 |
| us-gov-west-1 | 0.255 | 98 |
| us-west-1 | 0.239 | 2674 |
| us-west-2 | 0.241 | 75 |

