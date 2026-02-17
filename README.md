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
Updated: 2026-02-17T08:36:06.388713+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.672 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.660 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.972 |  |
| ap-southeast-1 | 0.808 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.823 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.427 |  |
| eu-west-3 | 0.454 |  |
| il-central-1 | 0.627 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.806 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.111 | 4134 |
| us-east-2 | 0.095 | 1350 |
| us-gov-east-1 | 0.086 | 1484 |
| us-gov-west-1 | 0.205 | 151 |
| us-west-1 | 0.226 | 3066 |
| us-west-2 | 0.207 | 126 |

