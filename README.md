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
Updated: 2026-02-13T20:29:33.776339+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.722 |  |
| ap-east-2 | 0.660 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.652 |  |
| ap-south-1 | 0.918 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.854 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.788 |  |
| ap-southeast-6 | 0.761 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.157 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.526 |  |
| eu-south-1 | 0.500 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.452 |  |
| il-central-1 | 0.643 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.815 |  |
| mx-central-1 | 0.176 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.132 | 4117 |
| us-east-2 | 0.106 | 1339 |
| us-gov-east-1 | 0.104 | 1458 |
| us-gov-west-1 | 0.204 | 147 |
| us-west-1 | 0.214 | 3054 |
| us-west-2 | 0.202 | 125 |

