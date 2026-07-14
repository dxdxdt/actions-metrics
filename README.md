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
Updated: 2026-07-14T22:50:43.359156+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.569 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.596 |  |
| ap-south-1 | 0.866 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.827 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.874 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.851 |  |
| ap-southeast-6 | 0.760 |  |
| ap-southeast-7 | 0.926 |  |
| ca-central-1 | 0.140 | 16 |
| ca-west-1 | 0.212 |  |
| eu-central-1 | 0.454 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.411 |  |
| eu-west-3 | 0.439 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.822 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.560 |  |
| us-east-1 | 0.114 | 4871 |
| us-east-2 | 0.121 | 1656 |
| us-gov-east-1 | 0.104 | 1750 |
| us-gov-west-1 | 0.241 | 202 |
| us-west-1 | 0.203 | 3776 |
| us-west-2 | 0.243 | 166 |

