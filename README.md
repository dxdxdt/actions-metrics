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
Updated: 2026-03-01T19:18:29.478298+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.043 |  |
| ap-east-1 | 0.653 |  |
| ap-east-2 | 0.597 |  |
| ap-northeast-1 | 0.477 |  |
| ap-northeast-2 | 0.583 |  |
| ap-northeast-3 | 0.500 |  |
| ap-south-1 | 0.947 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.637 |  |
| ap-southeast-3 | 0.788 |  |
| ap-southeast-4 | 0.674 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.834 |  |
| ca-central-1 | 0.267 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.545 |  |
| eu-central-2 | 0.560 |  |
| eu-north-1 | 0.594 |  |
| eu-south-1 | 0.574 |  |
| eu-south-2 | 0.581 |  |
| eu-west-1 | 0.460 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.730 |  |
| me-central-1 | 0.917 |  |
| me-south-1 | 0.873 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.662 |  |
| us-east-1 | 0.220 | 4207 |
| us-east-2 | 0.183 | 1387 |
| us-gov-east-1 | 0.183 | 1519 |
| us-gov-west-1 | 0.143 | 167 |
| us-west-1 | 0.126 | 3150 |
| us-west-2 | 0.143 | 136 |

