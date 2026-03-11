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
Updated: 2026-03-11T14:54:01.671928+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.515 |  |
| ap-northeast-2 | 0.621 |  |
| ap-northeast-3 | 0.539 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.778 |  |
| ap-southeast-2 | 0.678 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.794 |  |
| ap-southeast-6 | 0.715 |  |
| ap-southeast-7 | 0.870 |  |
| ca-central-1 | 0.210 | 16 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.562 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.545 |  |
| eu-west-1 | 0.444 |  |
| eu-west-2 | 0.475 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.680 |  |
| me-central-1 | 0.880 |  |
| me-south-1 | 0.850 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.164 | 4259 |
| us-east-2 | 0.163 | 1418 |
| us-gov-east-1 | 0.162 | 1561 |
| us-gov-west-1 | 0.207 | 178 |
| us-west-1 | 0.157 | 3210 |
| us-west-2 | 0.201 | 144 |

