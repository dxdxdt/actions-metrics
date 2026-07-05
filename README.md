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
Updated: 2026-07-05T13:14:09.290042+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.050 |  |
| ap-east-1 | 0.641 |  |
| ap-east-2 | 0.580 |  |
| ap-northeast-1 | 0.461 |  |
| ap-northeast-2 | 0.571 |  |
| ap-northeast-3 | 0.486 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.713 |  |
| ap-southeast-2 | 0.597 |  |
| ap-southeast-3 | 0.770 |  |
| ap-southeast-4 | 0.643 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.635 |  |
| ap-southeast-7 | 0.814 |  |
| ca-central-1 | 0.301 | 16 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.569 |  |
| eu-central-2 | 0.602 |  |
| eu-north-1 | 0.627 |  |
| eu-south-1 | 0.610 |  |
| eu-south-2 | 0.603 |  |
| eu-west-1 | 0.494 |  |
| eu-west-2 | 0.532 |  |
| eu-west-3 | 0.548 |  |
| il-central-1 | 0.732 |  |
| me-central-1 | 0.947 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.683 |  |
| us-east-1 | 0.239 | 4822 |
| us-east-2 | 0.228 | 1652 |
| us-gov-east-1 | 0.227 | 1729 |
| us-gov-west-1 | 0.130 | 200 |
| us-west-1 | 0.071 | 3746 |
| us-west-2 | 0.131 | 164 |

