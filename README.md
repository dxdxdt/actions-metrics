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
Updated: 2025-08-19T05:13:29.954484+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.869 |  |
| ap-east-1 | 0.856 |  |
| ap-northeast-1 | 0.665 |  |
| ap-northeast-2 | 0.772 |  |
| ap-south-1 | 0.824 |  |
| ap-southeast-1 | 0.905 |  |
| ap-southeast-2 | 0.816 |  |
| ca-central-1 | 0.099 | 11 |
| eu-central-1 | 0.386 |  |
| eu-north-1 | 0.423 |  |
| eu-south-1 | 0.401 |  |
| eu-west-1 | 0.290 |  |
| eu-west-2 | 0.335 |  |
| eu-west-3 | 0.361 |  |
| me-south-1 | 0.756 |  |
| sa-east-1 | 0.473 |  |
| us-east-1 | 0.047 | 2799 |
| us-east-2 | 0.089 | 734 |
| us-gov-east-1 | 0.091 | 875 |
| us-gov-west-1 | 0.334 | 2 |
| us-west-1 | 0.277 | 1871 |
| us-west-2 | 0.337 |  |

