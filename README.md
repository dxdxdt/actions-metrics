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
Updated: 2026-05-08T19:06:43.838834+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.688 |  |
| ap-northeast-1 | 0.577 |  |
| ap-northeast-2 | 0.675 |  |
| ap-northeast-3 | 0.599 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.794 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.110 | 16 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.495 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.487 |  |
| eu-west-1 | 0.384 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.431 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.827 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.562 |  |
| us-east-1 | 0.099 | 4612 |
| us-east-2 | 0.075 | 1575 |
| us-gov-east-1 | 0.071 | 1682 |
| us-gov-west-1 | 0.249 | 194 |
| us-west-1 | 0.204 | 3540 |
| us-west-2 | 0.252 | 157 |

