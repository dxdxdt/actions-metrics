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
Updated: 2026-09-20T02:38:09.139516+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.523 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.806 |  |
| ap-southeast-2 | 0.679 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.726 |  |
| ap-southeast-5 | 0.810 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.194 | 18 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.475 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.535 |  |
| eu-south-1 | 0.507 |  |
| eu-south-2 | 0.517 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.640 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.594 |  |
| us-east-1 | 0.144 | 5109 |
| us-east-2 | 0.165 | 1686 |
| us-gov-east-1 | 0.155 | 1920 |
| us-gov-west-1 | 0.217 | 234 |
| us-west-1 | 0.150 | 4127 |
| us-west-2 | 0.220 | 192 |

