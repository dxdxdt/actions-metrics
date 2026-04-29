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
Updated: 2026-04-29T02:10:02.485094+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.023 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.603 |  |
| ap-northeast-1 | 0.486 |  |
| ap-northeast-2 | 0.587 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.918 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.742 |  |
| ap-southeast-2 | 0.632 |  |
| ap-southeast-3 | 0.797 |  |
| ap-southeast-4 | 0.677 |  |
| ap-southeast-5 | 0.760 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.269 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.572 |  |
| eu-north-1 | 0.599 |  |
| eu-south-1 | 0.587 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.477 |  |
| eu-west-2 | 0.497 |  |
| eu-west-3 | 0.519 |  |
| il-central-1 | 0.707 |  |
| me-central-1 | 0.902 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.656 |  |
| us-east-1 | 0.206 | 4575 |
| us-east-2 | 0.205 | 1543 |
| us-gov-east-1 | 0.194 | 1666 |
| us-gov-west-1 | 0.162 | 194 |
| us-west-1 | 0.104 | 3498 |
| us-west-2 | 0.161 | 157 |

