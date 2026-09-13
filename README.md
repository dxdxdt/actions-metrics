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
Updated: 2026-09-13T07:51:22.231187+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.678 |  |
| ap-east-2 | 0.615 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.523 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.656 |  |
| ap-southeast-3 | 0.809 |  |
| ap-southeast-4 | 0.700 |  |
| ap-southeast-5 | 0.780 |  |
| ap-southeast-6 | 0.691 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.227 | 18 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.527 |  |
| eu-north-1 | 0.559 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.547 |  |
| eu-west-1 | 0.429 |  |
| eu-west-2 | 0.473 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.901 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.617 |  |
| us-east-1 | 0.175 | 5096 |
| us-east-2 | 0.190 | 1685 |
| us-gov-east-1 | 0.181 | 1912 |
| us-gov-west-1 | 0.188 | 233 |
| us-west-1 | 0.126 | 4107 |
| us-west-2 | 0.187 | 192 |

