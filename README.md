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
Updated: 2025-10-07T11:10:57.987075+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.051 |  |
| ap-east-1 | 0.667 |  |
| ap-northeast-1 | 0.473 |  |
| ap-northeast-2 | 0.582 |  |
| ap-south-1 | 0.958 |  |
| ap-southeast-1 | 0.731 |  |
| ap-southeast-2 | 0.603 |  |
| ca-central-1 | 0.285 | 15 |
| eu-central-1 | 0.591 |  |
| eu-north-1 | 0.627 |  |
| eu-south-1 | 0.599 |  |
| eu-west-1 | 0.498 |  |
| eu-west-2 | 0.536 |  |
| eu-west-3 | 0.558 |  |
| me-south-1 | 0.885 |  |
| sa-east-1 | 0.689 |  |
| us-east-1 | 0.248 | 3236 |
| us-east-2 | 0.201 | 865 |
| us-gov-east-1 | 0.221 | 1058 |
| us-gov-west-1 | 0.132 | 49 |
| us-west-1 | 0.082 | 2172 |
| us-west-2 | 0.134 | 20 |

