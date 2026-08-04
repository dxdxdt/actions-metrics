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
Updated: 2026-08-04T17:37:08.592990+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.701 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.850 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.796 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.953 |  |
| ca-central-1 | 0.143 | 17 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.427 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.463 |  |
| eu-south-1 | 0.454 |  |
| eu-south-2 | 0.462 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.406 |  |
| il-central-1 | 0.581 |  |
| me-central-1 | 0.832 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.089 | 4939 |
| us-east-2 | 0.111 | 1673 |
| us-gov-east-1 | 0.115 | 1801 |
| us-gov-west-1 | 0.276 | 210 |
| us-west-1 | 0.217 | 3883 |
| us-west-2 | 0.277 | 172 |

