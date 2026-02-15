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
Updated: 2026-02-15T18:25:43.478949+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.675 |  |
| ap-south-1 | 0.914 |  |
| ap-south-2 | 0.978 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.847 |  |
| ap-southeast-6 | 0.809 |  |
| ap-southeast-7 | 0.926 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.212 |  |
| eu-central-1 | 0.462 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.484 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.423 |  |
| eu-west-3 | 0.446 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.838 |  |
| me-south-1 | 0.800 |  |
| mx-central-1 | 0.197 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.096 | 4125 |
| us-east-2 | 0.086 | 1346 |
| us-gov-east-1 | 0.095 | 1474 |
| us-gov-west-1 | 0.223 | 148 |
| us-west-1 | 0.235 | 3062 |
| us-west-2 | 0.227 | 125 |

