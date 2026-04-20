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
Updated: 2026-04-20T04:55:56.574218+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.027 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.758 |  |
| ap-southeast-2 | 0.649 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.683 |  |
| ap-southeast-5 | 0.781 |  |
| ap-southeast-6 | 0.699 |  |
| ap-southeast-7 | 0.860 |  |
| ca-central-1 | 0.244 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.529 |  |
| eu-central-2 | 0.547 |  |
| eu-north-1 | 0.571 |  |
| eu-south-1 | 0.567 |  |
| eu-south-2 | 0.575 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.493 |  |
| eu-west-3 | 0.510 |  |
| il-central-1 | 0.722 |  |
| me-central-1 | 0.912 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.640 |  |
| us-east-1 | 0.189 | 4529 |
| us-east-2 | 0.166 | 1517 |
| us-gov-east-1 | 0.173 | 1657 |
| us-gov-west-1 | 0.166 | 194 |
| us-west-1 | 0.113 | 3447 |
| us-west-2 | 0.170 | 156 |

