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
Updated: 2026-04-06T16:38:28.893655+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.062 |  |
| ap-east-1 | 0.627 |  |
| ap-east-2 | 0.565 |  |
| ap-northeast-1 | 0.449 |  |
| ap-northeast-2 | 0.559 |  |
| ap-northeast-3 | 0.476 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.708 |  |
| ap-southeast-2 | 0.623 |  |
| ap-southeast-3 | 0.754 |  |
| ap-southeast-4 | 0.663 |  |
| ap-southeast-5 | 0.722 |  |
| ap-southeast-6 | 0.712 |  |
| ap-southeast-7 | 0.809 |  |
| ca-central-1 | 0.283 | 16 |
| ca-west-1 | 0.145 |  |
| eu-central-1 | 0.571 |  |
| eu-central-2 | 0.599 |  |
| eu-north-1 | 0.639 |  |
| eu-south-1 | 0.620 |  |
| eu-south-2 | 0.613 |  |
| eu-west-1 | 0.506 |  |
| eu-west-2 | 0.552 |  |
| eu-west-3 | 0.571 |  |
| il-central-1 | 0.762 |  |
| me-central-1 | 0.953 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.265 |  |
| sa-east-1 | 0.709 |  |
| us-east-1 | 0.237 | 4447 |
| us-east-2 | 0.208 | 1487 |
| us-gov-east-1 | 0.209 | 1630 |
| us-gov-west-1 | 0.113 | 191 |
| us-west-1 | 0.103 | 3364 |
| us-west-2 | 0.111 | 154 |

