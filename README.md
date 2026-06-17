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
Updated: 2026-06-17T06:03:20.156714+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.876 |  |
| ap-east-1 | 0.811 |  |
| ap-east-2 | 0.745 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.736 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.823 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.946 |  |
| ap-southeast-4 | 0.828 |  |
| ap-southeast-5 | 0.902 |  |
| ap-southeast-6 | 0.818 |  |
| ap-southeast-7 | 0.999 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.392 |  |
| eu-central-2 | 0.419 |  |
| eu-north-1 | 0.438 |  |
| eu-south-1 | 0.433 |  |
| eu-south-2 | 0.423 |  |
| eu-west-1 | 0.316 |  |
| eu-west-2 | 0.349 |  |
| eu-west-3 | 0.374 |  |
| il-central-1 | 0.552 |  |
| me-central-1 | 0.776 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.497 |  |
| us-east-1 | 0.068 | 4765 |
| us-east-2 | 0.090 | 1634 |
| us-gov-east-1 | 0.107 | 1713 |
| us-gov-west-1 | 0.310 | 198 |
| us-west-1 | 0.244 | 3673 |
| us-west-2 | 0.302 | 163 |

