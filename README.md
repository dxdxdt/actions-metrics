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
Updated: 2026-04-22T23:40:36.095143+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.739 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.658 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.856 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.806 |  |
| ap-southeast-2 | 0.711 |  |
| ap-southeast-3 | 0.868 |  |
| ap-southeast-4 | 0.751 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.921 |  |
| ca-central-1 | 0.193 | 16 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.394 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.444 |  |
| il-central-1 | 0.660 |  |
| me-central-1 | 0.844 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.138 | 4544 |
| us-east-2 | 0.137 | 1525 |
| us-gov-east-1 | 0.150 | 1661 |
| us-gov-west-1 | 0.228 | 194 |
| us-west-1 | 0.168 | 3462 |
| us-west-2 | 0.227 | 157 |

