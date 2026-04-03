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
Updated: 2026-04-03T11:33:25.464636+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.033 |  |
| ap-east-1 | 0.689 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.505 |  |
| ap-northeast-2 | 0.621 |  |
| ap-northeast-3 | 0.531 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.761 |  |
| ap-southeast-2 | 0.639 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.678 |  |
| ap-southeast-5 | 0.783 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.261 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.529 |  |
| eu-central-2 | 0.564 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.580 |  |
| eu-south-2 | 0.575 |  |
| eu-west-1 | 0.459 |  |
| eu-west-2 | 0.491 |  |
| eu-west-3 | 0.513 |  |
| il-central-1 | 0.729 |  |
| me-central-1 | 0.893 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.205 | 4424 |
| us-east-2 | 0.189 | 1475 |
| us-gov-east-1 | 0.189 | 1622 |
| us-gov-west-1 | 0.165 | 191 |
| us-west-1 | 0.107 | 3345 |
| us-west-2 | 0.163 | 153 |

