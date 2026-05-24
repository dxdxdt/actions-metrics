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
Updated: 2026-05-24T15:57:48.917035+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.668 |  |
| ap-northeast-1 | 0.550 |  |
| ap-northeast-2 | 0.661 |  |
| ap-northeast-3 | 0.577 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.805 |  |
| ap-southeast-2 | 0.716 |  |
| ap-southeast-3 | 0.860 |  |
| ap-southeast-4 | 0.751 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.912 |  |
| ca-central-1 | 0.156 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.488 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.495 |  |
| eu-south-2 | 0.525 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.624 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.575 |  |
| us-east-1 | 0.120 | 4684 |
| us-east-2 | 0.110 | 1611 |
| us-gov-east-1 | 0.102 | 1704 |
| us-gov-west-1 | 0.230 | 195 |
| us-west-1 | 0.171 | 3594 |
| us-west-2 | 0.228 | 159 |

