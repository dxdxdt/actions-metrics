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
Updated: 2026-02-18T14:03:30.826848+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.961 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.673 |  |
| ap-southeast-3 | 0.813 |  |
| ap-southeast-4 | 0.713 |  |
| ap-southeast-5 | 0.778 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.862 |  |
| ca-central-1 | 0.200 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.523 |  |
| eu-central-2 | 0.548 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.547 |  |
| eu-south-2 | 0.563 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.491 |  |
| eu-west-3 | 0.503 |  |
| il-central-1 | 0.727 |  |
| me-central-1 | 0.899 |  |
| me-south-1 | 0.868 |  |
| mx-central-1 | 0.193 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.170 | 4139 |
| us-east-2 | 0.140 | 1354 |
| us-gov-east-1 | 0.139 | 1488 |
| us-gov-west-1 | 0.161 | 155 |
| us-west-1 | 0.192 | 3073 |
| us-west-2 | 0.161 | 127 |

