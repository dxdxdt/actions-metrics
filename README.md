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
Updated: 2026-04-11T10:27:12.567247+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.955 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.679 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.589 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.833 |  |
| ap-southeast-6 | 0.830 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.145 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.469 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.488 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.440 |  |
| il-central-1 | 0.630 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.571 |  |
| us-east-1 | 0.115 | 4476 |
| us-east-2 | 0.103 | 1493 |
| us-gov-east-1 | 0.111 | 1640 |
| us-gov-west-1 | 0.234 | 192 |
| us-west-1 | 0.188 | 3395 |
| us-west-2 | 0.231 | 155 |

