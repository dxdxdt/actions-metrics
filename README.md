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
Updated: 2026-09-24T00:09:17.116000+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.931 |  |
| ap-east-1 | 0.767 |  |
| ap-east-2 | 0.698 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.684 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.898 |  |
| ap-southeast-2 | 0.727 |  |
| ap-southeast-3 | 0.922 |  |
| ap-southeast-4 | 0.774 |  |
| ap-southeast-5 | 0.888 |  |
| ap-southeast-6 | 0.787 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.160 | 18 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.466 |  |
| eu-north-1 | 0.497 |  |
| eu-south-1 | 0.473 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.404 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.609 |  |
| me-central-1 | 0.829 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.552 |  |
| us-east-1 | 0.112 | 5117 |
| us-east-2 | 0.120 | 1686 |
| us-gov-east-1 | 0.134 | 1924 |
| us-gov-west-1 | 0.259 | 235 |
| us-west-1 | 0.201 | 4136 |
| us-west-2 | 0.259 | 192 |

