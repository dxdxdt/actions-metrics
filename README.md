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
Updated: 2026-03-27T12:44:42.173146+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.678 |  |
| ap-east-2 | 0.616 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.527 |  |
| ap-south-1 | 0.888 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.758 |  |
| ap-southeast-2 | 0.650 |  |
| ap-southeast-3 | 0.809 |  |
| ap-southeast-4 | 0.683 |  |
| ap-southeast-5 | 0.775 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.244 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.545 |  |
| eu-north-1 | 0.596 |  |
| eu-south-1 | 0.563 |  |
| eu-south-2 | 0.601 |  |
| eu-west-1 | 0.470 |  |
| eu-west-2 | 0.495 |  |
| eu-west-3 | 0.503 |  |
| il-central-1 | 0.717 |  |
| me-central-1 | 0.909 |  |
| me-south-1 | 0.862 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.645 |  |
| us-east-1 | 0.199 | 4370 |
| us-east-2 | 0.188 | 1458 |
| us-gov-east-1 | 0.189 | 1608 |
| us-gov-west-1 | 0.174 | 190 |
| us-west-1 | 0.122 | 3307 |
| us-west-2 | 0.172 | 151 |

