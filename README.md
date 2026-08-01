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
Updated: 2026-08-01T20:08:29.185202+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.887 |  |
| ap-east-1 | 0.792 |  |
| ap-east-2 | 0.737 |  |
| ap-northeast-1 | 0.622 |  |
| ap-northeast-2 | 0.719 |  |
| ap-northeast-3 | 0.638 |  |
| ap-south-1 | 0.846 |  |
| ap-south-2 | 0.902 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.806 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.807 |  |
| ap-southeast-7 | 0.971 |  |
| ca-central-1 | 0.134 | 17 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.405 |  |
| eu-central-2 | 0.427 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.433 |  |
| eu-south-2 | 0.437 |  |
| eu-west-1 | 0.333 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.577 |  |
| me-central-1 | 0.801 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.515 |  |
| us-east-1 | 0.074 | 4931 |
| us-east-2 | 0.100 | 1673 |
| us-gov-east-1 | 0.107 | 1792 |
| us-gov-west-1 | 0.292 | 209 |
| us-west-1 | 0.233 | 3867 |
| us-west-2 | 0.293 | 172 |

