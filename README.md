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
Updated: 2026-04-28T21:01:20.006684+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.936 |  |
| ap-east-1 | 0.749 |  |
| ap-east-2 | 0.698 |  |
| ap-northeast-1 | 0.590 |  |
| ap-northeast-2 | 0.678 |  |
| ap-northeast-3 | 0.598 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.827 |  |
| ap-southeast-2 | 0.742 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.850 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.938 |  |
| ca-central-1 | 0.166 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.459 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.500 |  |
| eu-south-1 | 0.470 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.354 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.433 |  |
| il-central-1 | 0.605 |  |
| me-central-1 | 0.821 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.111 | 4575 |
| us-east-2 | 0.118 | 1542 |
| us-gov-east-1 | 0.127 | 1666 |
| us-gov-west-1 | 0.264 | 194 |
| us-west-1 | 0.204 | 3496 |
| us-west-2 | 0.265 | 157 |

