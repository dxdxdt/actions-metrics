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
Updated: 2026-11-20T16:32:04.811839+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.684 |  |
| ap-east-1 | 0.559 |  |
| ap-east-2 | 0.515 |  |
| ap-northeast-1 | 0.426 |  |
| ap-northeast-2 | 0.505 |  |
| ap-northeast-3 | 0.445 |  |
| ap-south-1 | 0.635 |  |
| ap-south-2 | 0.677 |  |
| ap-southeast-1 | 0.619 |  |
| ap-southeast-2 | 0.553 |  |
| ap-southeast-3 | 0.662 |  |
| ap-southeast-4 | 0.613 |  |
| ap-southeast-5 | 0.632 |  |
| ap-southeast-6 | 0.568 |  |
| ap-southeast-7 | 0.694 |  |
| ca-central-1 | 0.111 | 18 |
| ca-west-1 | 0.184 |  |
| eu-central-1 | 0.337 |  |
| eu-central-2 | 0.352 |  |
| eu-north-1 | 0.377 |  |
| eu-south-1 | 0.353 |  |
| eu-south-2 | 0.348 |  |
| eu-west-1 | 0.273 |  |
| eu-west-2 | 0.300 |  |
| eu-west-3 | 0.320 |  |
| il-central-1 | 0.454 |  |
| me-central-1 | 0.605 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.643 |  |
| mx-central-1 | 0.188 |  |
| sa-east-1 | 0.419 |  |
| us-east-1 | 0.081 | 5192 |
| us-east-2 | 0.101 | 1730 |
| us-gov-east-1 | 0.108 | 1963 |
| us-gov-west-1 | 0.181 | 248 |
| us-west-1 | 0.162 | 4220 |
| us-west-2 | 0.182 | 199 |

