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
Updated: 2026-02-21T13:37:51.149909+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.031 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.606 |  |
| ap-northeast-1 | 0.489 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.517 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.630 |  |
| ap-southeast-3 | 0.795 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.727 |  |
| ap-southeast-7 | 0.845 |  |
| ca-central-1 | 0.243 | 16 |
| ca-west-1 | 0.174 |  |
| eu-central-1 | 0.546 |  |
| eu-central-2 | 0.567 |  |
| eu-north-1 | 0.601 |  |
| eu-south-1 | 0.577 |  |
| eu-south-2 | 0.588 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.503 |  |
| eu-west-3 | 0.524 |  |
| il-central-1 | 0.732 |  |
| me-central-1 | 0.928 |  |
| me-south-1 | 0.879 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.661 |  |
| us-east-1 | 0.205 | 4157 |
| us-east-2 | 0.174 | 1361 |
| us-gov-east-1 | 0.176 | 1498 |
| us-gov-west-1 | 0.143 | 160 |
| us-west-1 | 0.118 | 3092 |
| us-west-2 | 0.145 | 129 |

