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
Updated: 2025-05-10T21:10:45.557712+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.960 |  |
| ap-east-1 | 0.746 |  |
| ap-northeast-1 | 0.554 |  |
| ap-northeast-2 | 0.659 |  |
| ap-south-1 | 0.885 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.709 |  |
| ca-central-1 | 0.199 | 10 |
| eu-central-1 | 0.491 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.512 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.443 |  |
| eu-west-3 | 0.464 |  |
| me-south-1 | 0.833 |  |
| sa-east-1 | 0.603 |  |
| us-east-1 | 0.152 | 1834 |
| us-east-2 | 0.162 | 421 |
| us-gov-east-1 | 0.133 | 528 |
| us-gov-west-1 | 0.216 | 1 |
| us-west-1 | 0.196 | 1285 |
| us-west-2 | 0.214 |  |

