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
Updated: 2026-04-30T17:11:48.200649+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.987 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.648 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.920 |  |
| ap-south-2 | 1.002 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.739 |  |
| ap-southeast-5 | 0.808 |  |
| ap-southeast-6 | 0.726 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.548 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.436 |  |
| eu-west-2 | 0.466 |  |
| eu-west-3 | 0.480 |  |
| il-central-1 | 0.683 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.181 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.126 | 4576 |
| us-east-2 | 0.099 | 1551 |
| us-gov-east-1 | 0.097 | 1668 |
| us-gov-west-1 | 0.232 | 194 |
| us-west-1 | 0.169 | 3505 |
| us-west-2 | 0.223 | 157 |

