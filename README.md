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
Updated: 2026-03-16T21:32:34.878919+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.666 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.874 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.876 |  |
| ap-southeast-4 | 0.767 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.455 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.507 |  |
| eu-south-1 | 0.476 |  |
| eu-south-2 | 0.505 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.413 |  |
| eu-west-3 | 0.429 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.789 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.548 |  |
| us-east-1 | 0.114 | 4292 |
| us-east-2 | 0.128 | 1429 |
| us-gov-east-1 | 0.136 | 1578 |
| us-gov-west-1 | 0.241 | 186 |
| us-west-1 | 0.195 | 3244 |
| us-west-2 | 0.256 | 148 |

