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
Updated: 2026-07-08T01:55:37.270162+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.757 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.608 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.777 |  |
| ap-southeast-5 | 0.856 |  |
| ap-southeast-6 | 0.760 |  |
| ap-southeast-7 | 0.940 |  |
| ca-central-1 | 0.142 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.476 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.493 |  |
| eu-south-2 | 0.491 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.409 |  |
| eu-west-3 | 0.451 |  |
| il-central-1 | 0.606 |  |
| me-central-1 | 0.810 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.557 |  |
| us-east-1 | 0.111 | 4833 |
| us-east-2 | 0.106 | 1655 |
| us-gov-east-1 | 0.105 | 1730 |
| us-gov-west-1 | 0.247 | 201 |
| us-west-1 | 0.194 | 3755 |
| us-west-2 | 0.249 | 164 |

