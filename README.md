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
Updated: 2026-05-02T16:38:41.655334+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.620 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.533 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.758 |  |
| ap-southeast-2 | 0.664 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.694 |  |
| ap-southeast-5 | 0.773 |  |
| ap-southeast-6 | 0.691 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.233 | 16 |
| ca-west-1 | 0.193 |  |
| eu-central-1 | 0.552 |  |
| eu-central-2 | 0.555 |  |
| eu-north-1 | 0.597 |  |
| eu-south-1 | 0.561 |  |
| eu-south-2 | 0.572 |  |
| eu-west-1 | 0.457 |  |
| eu-west-2 | 0.485 |  |
| eu-west-3 | 0.529 |  |
| il-central-1 | 0.691 |  |
| me-central-1 | 0.902 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.642 |  |
| us-east-1 | 0.187 | 4585 |
| us-east-2 | 0.152 | 1558 |
| us-gov-east-1 | 0.165 | 1670 |
| us-gov-west-1 | 0.166 | 194 |
| us-west-1 | 0.117 | 3518 |
| us-west-2 | 0.166 | 157 |

