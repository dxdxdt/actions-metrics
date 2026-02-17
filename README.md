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
Updated: 2026-02-17T09:40:44.735004+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.628 |  |
| ap-south-1 | 0.955 |  |
| ap-south-2 | 0.992 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.791 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.184 | 16 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.497 |  |
| eu-central-2 | 0.513 |  |
| eu-north-1 | 0.553 |  |
| eu-south-1 | 0.522 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.458 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.833 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.145 | 4134 |
| us-east-2 | 0.142 | 1350 |
| us-gov-east-1 | 0.119 | 1484 |
| us-gov-west-1 | 0.173 | 152 |
| us-west-1 | 0.191 | 3066 |
| us-west-2 | 0.174 | 126 |

