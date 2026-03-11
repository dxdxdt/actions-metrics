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
Updated: 2026-03-11T17:43:39.816392+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.668 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.578 |  |
| ap-south-1 | 0.941 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.800 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.820 |  |
| ap-southeast-6 | 0.821 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.140 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.512 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.658 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.801 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.580 |  |
| us-east-1 | 0.129 | 4259 |
| us-east-2 | 0.112 | 1419 |
| us-gov-east-1 | 0.096 | 1562 |
| us-gov-west-1 | 0.203 | 179 |
| us-west-1 | 0.213 | 3210 |
| us-west-2 | 0.205 | 144 |

