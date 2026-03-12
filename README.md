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
Updated: 2026-03-12T01:16:53.095172+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.951 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.675 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.772 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.769 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.176 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.476 |  |
| eu-north-1 | 0.525 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.497 |  |
| eu-west-1 | 0.388 |  |
| eu-west-2 | 0.423 |  |
| eu-west-3 | 0.439 |  |
| il-central-1 | 0.636 |  |
| me-central-1 | 0.836 |  |
| me-south-1 | 0.804 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.567 |  |
| us-east-1 | 0.132 | 4261 |
| us-east-2 | 0.141 | 1419 |
| us-gov-east-1 | 0.143 | 1564 |
| us-gov-west-1 | 0.255 | 179 |
| us-west-1 | 0.182 | 3213 |
| us-west-2 | 0.254 | 144 |

