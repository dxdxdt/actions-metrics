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
Updated: 2025-10-30T06:19:41.113605+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.046 |  |
| ap-east-1 | 0.694 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.616 |  |
| ap-south-1 | 0.883 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.643 |  |
| ca-central-1 | 0.227 | 15 |
| eu-central-1 | 0.541 |  |
| eu-north-1 | 0.581 |  |
| eu-south-1 | 0.550 |  |
| eu-west-1 | 0.460 |  |
| eu-west-2 | 0.502 |  |
| eu-west-3 | 0.520 |  |
| me-south-1 | 0.875 |  |
| sa-east-1 | 0.645 |  |
| us-east-1 | 0.198 | 3384 |
| us-east-2 | 0.178 | 996 |
| us-gov-east-1 | 0.181 | 1125 |
| us-gov-west-1 | 0.160 | 68 |
| us-west-1 | 0.123 | 2322 |
| us-west-2 | 0.162 | 22 |

