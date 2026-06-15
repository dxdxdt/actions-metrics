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
Updated: 2026-06-15T00:18:38.155362+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.920 |  |
| ap-east-1 | 0.755 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.928 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.880 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.851 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.933 |  |
| ca-central-1 | 0.136 | 16 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.443 |  |
| eu-central-2 | 0.460 |  |
| eu-north-1 | 0.495 |  |
| eu-south-1 | 0.473 |  |
| eu-south-2 | 0.487 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.425 |  |
| il-central-1 | 0.602 |  |
| me-central-1 | 0.800 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.552 |  |
| us-east-1 | 0.105 | 4759 |
| us-east-2 | 0.089 | 1634 |
| us-gov-east-1 | 0.092 | 1713 |
| us-gov-west-1 | 0.249 | 198 |
| us-west-1 | 0.196 | 3666 |
| us-west-2 | 0.251 | 163 |

