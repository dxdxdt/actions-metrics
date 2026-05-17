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
Updated: 2026-05-17T13:01:39.779883+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.509 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.657 |  |
| ap-southeast-3 | 0.818 |  |
| ap-southeast-4 | 0.694 |  |
| ap-southeast-5 | 0.780 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.868 |  |
| ca-central-1 | 0.233 | 16 |
| ca-west-1 | 0.195 |  |
| eu-central-1 | 0.537 |  |
| eu-central-2 | 0.543 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.564 |  |
| eu-west-1 | 0.454 |  |
| eu-west-2 | 0.487 |  |
| eu-west-3 | 0.497 |  |
| il-central-1 | 0.682 |  |
| me-central-1 | 0.902 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.192 | 4653 |
| us-east-2 | 0.157 | 1598 |
| us-gov-east-1 | 0.183 | 1696 |
| us-gov-west-1 | 0.178 | 195 |
| us-west-1 | 0.122 | 3572 |
| us-west-2 | 0.180 | 158 |

