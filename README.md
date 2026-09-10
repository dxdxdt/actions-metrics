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
Updated: 2026-09-10T02:20:45.781159+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.970 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.652 |  |
| ap-northeast-1 | 0.542 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.564 |  |
| ap-south-1 | 0.927 |  |
| ap-south-2 | 0.986 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.810 |  |
| ap-southeast-6 | 0.724 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.192 | 18 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.538 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.281 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.134 | 5094 |
| us-east-2 | 0.143 | 1685 |
| us-gov-east-1 | 0.114 | 1905 |
| us-gov-west-1 | 0.215 | 233 |
| us-west-1 | 0.158 | 4094 |
| us-west-2 | 0.213 | 192 |

