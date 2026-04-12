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
Updated: 2026-04-12T17:28:43.694111+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.745 |  |
| ap-east-2 | 0.687 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.673 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.939 |  |
| ap-southeast-1 | 0.820 |  |
| ap-southeast-2 | 0.743 |  |
| ap-southeast-3 | 0.873 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.838 |  |
| ap-southeast-7 | 0.922 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.459 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.480 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.384 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.441 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.201 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.101 | 4488 |
| us-east-2 | 0.081 | 1497 |
| us-gov-east-1 | 0.078 | 1645 |
| us-gov-west-1 | 0.241 | 192 |
| us-west-1 | 0.191 | 3401 |
| us-west-2 | 0.243 | 155 |

