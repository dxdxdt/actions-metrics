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
Updated: 2026-05-01T10:18:13.556024+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.535 |  |
| ap-northeast-2 | 0.645 |  |
| ap-northeast-3 | 0.561 |  |
| ap-south-1 | 0.856 |  |
| ap-south-2 | 0.934 |  |
| ap-southeast-1 | 0.789 |  |
| ap-southeast-2 | 0.694 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.812 |  |
| ap-southeast-6 | 0.723 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.174 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.515 |  |
| eu-central-2 | 0.520 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.522 |  |
| eu-south-2 | 0.540 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.456 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.667 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.150 | 4578 |
| us-east-2 | 0.119 | 1553 |
| us-gov-east-1 | 0.129 | 1669 |
| us-gov-west-1 | 0.214 | 194 |
| us-west-1 | 0.155 | 3509 |
| us-west-2 | 0.205 | 157 |

