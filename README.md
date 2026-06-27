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
Updated: 2026-06-27T06:24:38.567313+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.706 |  |
| ap-east-2 | 0.646 |  |
| ap-northeast-1 | 0.527 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.781 |  |
| ap-southeast-2 | 0.673 |  |
| ap-southeast-3 | 0.836 |  |
| ap-southeast-4 | 0.714 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.701 |  |
| ap-southeast-7 | 0.880 |  |
| ca-central-1 | 0.205 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.550 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.549 |  |
| eu-south-2 | 0.549 |  |
| eu-west-1 | 0.438 |  |
| eu-west-2 | 0.475 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.886 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.165 | 4790 |
| us-east-2 | 0.137 | 1643 |
| us-gov-east-1 | 0.139 | 1721 |
| us-gov-west-1 | 0.195 | 199 |
| us-west-1 | 0.136 | 3712 |
| us-west-2 | 0.193 | 163 |

