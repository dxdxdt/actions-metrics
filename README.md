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
Updated: 2026-03-22T04:13:05.882891+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.737 |  |
| ap-east-2 | 0.677 |  |
| ap-northeast-1 | 0.554 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.582 |  |
| ap-south-1 | 0.866 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.725 |  |
| ap-southeast-3 | 0.876 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.838 |  |
| ap-southeast-6 | 0.760 |  |
| ap-southeast-7 | 0.922 |  |
| ca-central-1 | 0.180 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.370 |  |
| eu-west-2 | 0.405 |  |
| eu-west-3 | 0.432 |  |
| il-central-1 | 0.636 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.785 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.126 | 4325 |
| us-east-2 | 0.144 | 1446 |
| us-gov-east-1 | 0.144 | 1594 |
| us-gov-west-1 | 0.249 | 189 |
| us-west-1 | 0.196 | 3276 |
| us-west-2 | 0.248 | 151 |

