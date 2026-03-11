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
Updated: 2026-03-11T18:44:19.533906+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.926 |  |
| ap-east-1 | 0.769 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.781 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.847 |  |
| ap-southeast-7 | 0.951 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.436 |  |
| eu-north-1 | 0.469 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.458 |  |
| eu-west-1 | 0.345 |  |
| eu-west-2 | 0.374 |  |
| eu-west-3 | 0.411 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.753 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.521 |  |
| us-east-1 | 0.085 | 4260 |
| us-east-2 | 0.102 | 1419 |
| us-gov-east-1 | 0.090 | 1562 |
| us-gov-west-1 | 0.275 | 179 |
| us-west-1 | 0.255 | 3210 |
| us-west-2 | 0.278 | 144 |

