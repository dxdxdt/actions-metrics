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
Updated: 2026-04-09T11:49:11.971921+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.932 |  |
| ap-east-1 | 0.771 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.696 |  |
| ap-northeast-3 | 0.618 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.953 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.799 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.811 |  |
| ap-southeast-7 | 0.945 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.461 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.457 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.421 |  |
| il-central-1 | 0.612 |  |
| me-central-1 | 0.810 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.535 |  |
| us-east-1 | 0.082 | 4464 |
| us-east-2 | 0.084 | 1489 |
| us-gov-east-1 | 0.073 | 1636 |
| us-gov-west-1 | 0.268 | 192 |
| us-west-1 | 0.215 | 3382 |
| us-west-2 | 0.268 | 154 |

