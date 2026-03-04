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
Updated: 2026-03-04T01:19:15.388184+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.681 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.751 |  |
| ap-southeast-2 | 0.720 |  |
| ap-southeast-3 | 0.811 |  |
| ap-southeast-4 | 0.684 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.691 |  |
| ap-southeast-7 | 0.858 |  |
| ca-central-1 | 0.237 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.541 |  |
| eu-central-2 | 0.565 |  |
| eu-north-1 | 0.596 |  |
| eu-south-1 | 0.561 |  |
| eu-south-2 | 0.574 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.508 |  |
| eu-west-3 | 0.525 |  |
| il-central-1 | 0.713 |  |
| me-central-1 | 0.900 |  |
| me-south-1 | 0.871 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.202 | 4214 |
| us-east-2 | 0.185 | 1397 |
| us-gov-east-1 | 0.172 | 1527 |
| us-gov-west-1 | 0.154 | 169 |
| us-west-1 | 0.127 | 3168 |
| us-west-2 | 0.159 | 138 |

