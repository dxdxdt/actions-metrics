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
Updated: 2026-06-17T11:29:53.528885+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.993 |  |
| ap-east-1 | 0.720 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.531 |  |
| ap-northeast-2 | 0.649 |  |
| ap-northeast-3 | 0.555 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.791 |  |
| ap-southeast-2 | 0.668 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.810 |  |
| ap-southeast-6 | 0.708 |  |
| ap-southeast-7 | 0.900 |  |
| ca-central-1 | 0.228 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.442 |  |
| eu-west-2 | 0.465 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.667 |  |
| me-central-1 | 0.904 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.172 | 4765 |
| us-east-2 | 0.165 | 1634 |
| us-gov-east-1 | 0.179 | 1713 |
| us-gov-west-1 | 0.201 | 198 |
| us-west-1 | 0.141 | 3674 |
| us-west-2 | 0.198 | 163 |

