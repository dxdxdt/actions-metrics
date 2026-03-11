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
Updated: 2026-03-11T07:39:06.431857+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.675 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.978 |  |
| ap-southeast-1 | 0.822 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.876 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.837 |  |
| ap-southeast-6 | 0.791 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.463 |  |
| eu-central-2 | 0.480 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.480 |  |
| eu-south-2 | 0.491 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.409 |  |
| eu-west-3 | 0.432 |  |
| il-central-1 | 0.614 |  |
| me-central-1 | 0.850 |  |
| me-south-1 | 0.802 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.553 |  |
| us-east-1 | 0.120 | 4258 |
| us-east-2 | 0.095 | 1418 |
| us-gov-east-1 | 0.103 | 1558 |
| us-gov-west-1 | 0.227 | 178 |
| us-west-1 | 0.224 | 3207 |
| us-west-2 | 0.236 | 144 |

