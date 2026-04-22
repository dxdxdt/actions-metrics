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
Updated: 2026-04-22T20:44:50.620892+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.042 |  |
| ap-east-1 | 0.663 |  |
| ap-east-2 | 0.593 |  |
| ap-northeast-1 | 0.475 |  |
| ap-northeast-2 | 0.573 |  |
| ap-northeast-3 | 0.500 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.732 |  |
| ap-southeast-2 | 0.619 |  |
| ap-southeast-3 | 0.791 |  |
| ap-southeast-4 | 0.662 |  |
| ap-southeast-5 | 0.751 |  |
| ap-southeast-6 | 0.699 |  |
| ap-southeast-7 | 0.838 |  |
| ca-central-1 | 0.272 | 16 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.553 |  |
| eu-central-2 | 0.576 |  |
| eu-north-1 | 0.610 |  |
| eu-south-1 | 0.583 |  |
| eu-south-2 | 0.594 |  |
| eu-west-1 | 0.474 |  |
| eu-west-2 | 0.509 |  |
| eu-west-3 | 0.528 |  |
| il-central-1 | 0.749 |  |
| me-central-1 | 0.905 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.681 |  |
| us-east-1 | 0.214 | 4543 |
| us-east-2 | 0.208 | 1524 |
| us-gov-east-1 | 0.204 | 1661 |
| us-gov-west-1 | 0.146 | 194 |
| us-west-1 | 0.093 | 3461 |
| us-west-2 | 0.146 | 157 |

