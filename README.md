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
Updated: 2026-06-27T15:10:18.088359+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.938 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.676 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.661 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.809 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.860 |  |
| ap-southeast-4 | 0.759 |  |
| ap-southeast-5 | 0.829 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.462 |  |
| eu-central-2 | 0.485 |  |
| eu-north-1 | 0.503 |  |
| eu-south-1 | 0.495 |  |
| eu-south-2 | 0.499 |  |
| eu-west-1 | 0.378 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.440 |  |
| il-central-1 | 0.612 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.576 |  |
| us-east-1 | 0.123 | 4792 |
| us-east-2 | 0.121 | 1643 |
| us-gov-east-1 | 0.126 | 1722 |
| us-gov-west-1 | 0.229 | 199 |
| us-west-1 | 0.180 | 3713 |
| us-west-2 | 0.229 | 163 |

