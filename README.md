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
Updated: 2026-03-01T01:28:59.350322+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.040 |  |
| ap-east-1 | 0.667 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.596 |  |
| ap-northeast-3 | 0.515 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.741 |  |
| ap-southeast-2 | 0.629 |  |
| ap-southeast-3 | 0.795 |  |
| ap-southeast-4 | 0.669 |  |
| ap-southeast-5 | 0.760 |  |
| ap-southeast-6 | 0.696 |  |
| ap-southeast-7 | 0.842 |  |
| ca-central-1 | 0.228 | 16 |
| ca-west-1 | 0.176 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.570 |  |
| eu-north-1 | 0.614 |  |
| eu-south-1 | 0.580 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.482 |  |
| eu-west-2 | 0.512 |  |
| eu-west-3 | 0.534 |  |
| il-central-1 | 0.734 |  |
| me-central-1 | 0.923 |  |
| me-south-1 | 0.879 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.650 |  |
| us-east-1 | 0.207 | 4201 |
| us-east-2 | 0.181 | 1386 |
| us-gov-east-1 | 0.183 | 1519 |
| us-gov-west-1 | 0.146 | 166 |
| us-west-1 | 0.118 | 3144 |
| us-west-2 | 0.147 | 134 |

