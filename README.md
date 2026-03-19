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
Updated: 2026-03-19T21:29:08.086395+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.093 |  |
| ap-east-1 | 0.628 |  |
| ap-east-2 | 0.571 |  |
| ap-northeast-1 | 0.450 |  |
| ap-northeast-2 | 0.557 |  |
| ap-northeast-3 | 0.475 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.705 |  |
| ap-southeast-2 | 0.585 |  |
| ap-southeast-3 | 0.756 |  |
| ap-southeast-4 | 0.623 |  |
| ap-southeast-5 | 0.723 |  |
| ap-southeast-6 | 0.654 |  |
| ap-southeast-7 | 0.814 |  |
| ca-central-1 | 0.309 | 16 |
| ca-west-1 | 0.175 |  |
| eu-central-1 | 0.593 |  |
| eu-central-2 | 0.601 |  |
| eu-north-1 | 0.645 |  |
| eu-south-1 | 0.619 |  |
| eu-south-2 | 0.630 |  |
| eu-west-1 | 0.506 |  |
| eu-west-2 | 0.566 |  |
| eu-west-3 | 0.569 |  |
| il-central-1 | 0.768 |  |
| me-central-1 | 0.968 |  |
| me-south-1 | 0.933 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.706 |  |
| us-east-1 | 0.258 | 4310 |
| us-east-2 | 0.248 | 1437 |
| us-gov-east-1 | 0.254 | 1589 |
| us-gov-west-1 | 0.115 | 189 |
| us-west-1 | 0.058 | 3262 |
| us-west-2 | 0.116 | 148 |

