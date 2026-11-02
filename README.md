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
Updated: 2026-11-02T21:10:40.438206+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.738 |  |
| ap-east-1 | 0.524 |  |
| ap-east-2 | 0.480 |  |
| ap-northeast-1 | 0.391 |  |
| ap-northeast-2 | 0.470 |  |
| ap-northeast-3 | 0.413 |  |
| ap-south-1 | 0.681 |  |
| ap-south-2 | 0.740 |  |
| ap-southeast-1 | 0.591 |  |
| ap-southeast-2 | 0.514 |  |
| ap-southeast-3 | 0.625 |  |
| ap-southeast-4 | 0.583 |  |
| ap-southeast-5 | 0.599 |  |
| ap-southeast-6 | 0.534 |  |
| ap-southeast-7 | 0.661 |  |
| ca-central-1 | 0.134 | 18 |
| ca-west-1 | 0.158 |  |
| eu-central-1 | 0.379 |  |
| eu-central-2 | 0.401 |  |
| eu-north-1 | 0.406 |  |
| eu-south-1 | 0.385 |  |
| eu-south-2 | 0.385 |  |
| eu-west-1 | 0.315 |  |
| eu-west-2 | 0.350 |  |
| eu-west-3 | 0.362 |  |
| il-central-1 | 0.495 |  |
| me-central-1 | 0.633 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.151 |  |
| sa-east-1 | 0.467 |  |
| us-east-1 | 0.116 | 5168 |
| us-east-2 | 0.109 | 1721 |
| us-gov-east-1 | 0.116 | 1959 |
| us-gov-west-1 | 0.151 | 242 |
| us-west-1 | 0.109 | 4204 |
| us-west-2 | 0.151 | 195 |

