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
Updated: 2026-11-27T23:05:50.893865+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.730 |  |
| ap-east-1 | 0.510 |  |
| ap-east-2 | 0.466 |  |
| ap-northeast-1 | 0.377 |  |
| ap-northeast-2 | 0.453 |  |
| ap-northeast-3 | 0.396 |  |
| ap-south-1 | 0.707 |  |
| ap-south-2 | 0.733 |  |
| ap-southeast-1 | 0.571 |  |
| ap-southeast-2 | 0.498 |  |
| ap-southeast-3 | 0.613 |  |
| ap-southeast-4 | 0.556 |  |
| ap-southeast-5 | 0.587 |  |
| ap-southeast-6 | 0.520 |  |
| ap-southeast-7 | 0.647 |  |
| ca-central-1 | 0.158 | 18 |
| ca-west-1 | 0.193 |  |
| eu-central-1 | 0.389 |  |
| eu-central-2 | 0.401 |  |
| eu-north-1 | 0.414 |  |
| eu-south-1 | 0.403 |  |
| eu-south-2 | 0.395 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.354 |  |
| eu-west-3 | 0.378 |  |
| il-central-1 | 0.512 |  |
| me-central-1 | 0.662 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.706 |  |
| mx-central-1 | 0.158 |  |
| sa-east-1 | 0.478 |  |
| sa-west-1 | 0.488 |  |
| us-east-1 | 0.133 | 5196 |
| us-east-2 | 0.123 | 1731 |
| us-gov-east-1 | 0.122 | 1968 |
| us-gov-west-1 | 0.136 | 251 |
| us-west-1 | 0.092 | 4228 |
| us-west-2 | 0.136 | 200 |

