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
Updated: 2026-04-02T01:28:37.820185+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.788 |  |
| ap-east-2 | 0.726 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.856 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.819 |  |
| ap-southeast-5 | 0.872 |  |
| ap-southeast-6 | 0.845 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.436 |  |
| eu-north-1 | 0.473 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.335 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.604 |  |
| us-east-1 | 0.075 | 4418 |
| us-east-2 | 0.080 | 1472 |
| us-gov-east-1 | 0.077 | 1619 |
| us-gov-west-1 | 0.291 | 190 |
| us-west-1 | 0.251 | 3333 |
| us-west-2 | 0.288 | 153 |

