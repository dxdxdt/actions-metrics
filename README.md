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
Updated: 2025-10-14T14:13:34.993918+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.719 |  |
| ap-northeast-1 | 0.515 |  |
| ap-northeast-2 | 0.622 |  |
| ap-south-1 | 0.947 |  |
| ap-southeast-1 | 0.771 |  |
| ap-southeast-2 | 0.669 |  |
| ca-central-1 | 0.193 | 15 |
| eu-central-1 | 0.527 |  |
| eu-north-1 | 0.562 |  |
| eu-south-1 | 0.537 |  |
| eu-west-1 | 0.438 |  |
| eu-west-2 | 0.471 |  |
| eu-west-3 | 0.501 |  |
| me-south-1 | 0.848 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.168 | 3284 |
| us-east-2 | 0.148 | 906 |
| us-gov-east-1 | 0.140 | 1083 |
| us-gov-west-1 | 0.169 | 51 |
| us-west-1 | 0.158 | 2218 |
| us-west-2 | 0.173 | 21 |

