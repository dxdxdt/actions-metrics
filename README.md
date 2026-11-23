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
Updated: 2026-11-23T10:01:58.565832+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.695 |  |
| ap-east-1 | 0.552 |  |
| ap-east-2 | 0.506 |  |
| ap-northeast-1 | 0.409 |  |
| ap-northeast-2 | 0.488 |  |
| ap-northeast-3 | 0.428 |  |
| ap-south-1 | 0.649 |  |
| ap-south-2 | 0.671 |  |
| ap-southeast-1 | 0.605 |  |
| ap-southeast-2 | 0.535 |  |
| ap-southeast-3 | 0.696 |  |
| ap-southeast-4 | 0.594 |  |
| ap-southeast-5 | 0.624 |  |
| ap-southeast-6 | 0.555 |  |
| ap-southeast-7 | 0.684 |  |
| ca-central-1 | 0.127 | 18 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.344 |  |
| eu-central-2 | 0.363 |  |
| eu-north-1 | 0.379 |  |
| eu-south-1 | 0.359 |  |
| eu-south-2 | 0.350 |  |
| eu-west-1 | 0.294 |  |
| eu-west-2 | 0.317 |  |
| eu-west-3 | 0.330 |  |
| il-central-1 | 0.467 |  |
| me-central-1 | 0.621 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.652 |  |
| mx-central-1 | 0.185 |  |
| sa-east-1 | 0.434 |  |
| us-east-1 | 0.093 | 5195 |
| us-east-2 | 0.107 | 1730 |
| us-gov-east-1 | 0.117 | 1966 |
| us-gov-west-1 | 0.171 | 249 |
| us-west-1 | 0.145 | 4222 |
| us-west-2 | 0.171 | 200 |

