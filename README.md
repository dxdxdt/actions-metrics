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
Updated: 2026-05-10T22:38:54.611388+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.778 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.692 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.832 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.851 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.806 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.854 |  |
| ap-southeast-7 | 0.954 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.450 |  |
| eu-north-1 | 0.468 |  |
| eu-south-1 | 0.451 |  |
| eu-south-2 | 0.458 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.390 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.610 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.532 |  |
| us-east-1 | 0.086 | 4624 |
| us-east-2 | 0.103 | 1587 |
| us-gov-east-1 | 0.103 | 1685 |
| us-gov-west-1 | 0.286 | 195 |
| us-west-1 | 0.248 | 3547 |
| us-west-2 | 0.282 | 158 |

