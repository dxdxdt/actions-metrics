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
Updated: 2025-02-25T10:12:51.050854+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.762 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.676 |  |
| ap-south-1 | 0.889 |  |
| ap-southeast-1 | 0.825 |  |
| ap-southeast-2 | 0.726 |  |
| ca-central-1 | 0.124 | 4 |
| eu-central-1 | 0.474 |  |
| eu-north-1 | 0.519 |  |
| eu-south-1 | 0.484 |  |
| eu-west-1 | 0.381 |  |
| eu-west-2 | 0.424 |  |
| eu-west-3 | 0.445 |  |
| me-south-1 | 0.815 |  |
| sa-east-1 | 0.568 |  |
| us-east-1 | 0.111 | 1097 |
| us-east-2 | 0.089 | 269 |
| us-gov-east-1 | 0.090 | 276 |
| us-gov-west-1 | 0.224 | 1 |
| us-west-1 | 0.222 | 731 |
| us-west-2 | 0.222 |  |

