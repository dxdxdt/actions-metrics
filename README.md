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
Updated: 2026-03-20T11:26:09.085464+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.781 |  |
| ap-east-2 | 0.723 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.630 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.866 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.920 |  |
| ap-southeast-4 | 0.811 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.137 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.402 |  |
| eu-central-2 | 0.426 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.433 |  |
| eu-south-2 | 0.435 |  |
| eu-west-1 | 0.333 |  |
| eu-west-2 | 0.363 |  |
| eu-west-3 | 0.381 |  |
| il-central-1 | 0.592 |  |
| me-central-1 | 0.786 |  |
| me-south-1 | 0.742 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.506 |  |
| us-east-1 | 0.077 | 4314 |
| us-east-2 | 0.091 | 1439 |
| us-gov-east-1 | 0.107 | 1590 |
| us-gov-west-1 | 0.293 | 189 |
| us-west-1 | 0.249 | 3266 |
| us-west-2 | 0.288 | 148 |

