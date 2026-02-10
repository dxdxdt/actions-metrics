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
Updated: 2026-02-10T12:55:27.429299+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.985 |  |
| ap-east-1 | 0.730 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.654 |  |
| ap-south-1 | 0.938 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.738 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.489 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.524 |  |
| eu-south-2 | 0.527 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.438 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.654 |  |
| me-central-1 | 0.874 |  |
| me-south-1 | 0.839 |  |
| sa-east-1 | 0.586 |  |
| us-east-1 | 0.142 | 4096 |
| us-east-2 | 0.124 | 1329 |
| us-gov-east-1 | 0.127 | 1449 |
| us-gov-west-1 | 0.196 | 142 |
| us-west-1 | 0.178 | 3034 |
| us-west-2 | 0.207 | 125 |

