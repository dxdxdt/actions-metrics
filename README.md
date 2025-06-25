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
Updated: 2025-06-25T01:04:08.728979+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.774 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.686 |  |
| ap-south-1 | 0.881 |  |
| ap-southeast-1 | 0.844 |  |
| ap-southeast-2 | 0.736 |  |
| ca-central-1 | 0.162 | 10 |
| eu-central-1 | 0.451 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.473 |  |
| eu-west-1 | 0.365 |  |
| eu-west-2 | 0.401 |  |
| eu-west-3 | 0.418 |  |
| me-south-1 | 0.797 |  |
| sa-east-1 | 0.567 |  |
| us-east-1 | 0.095 | 2258 |
| us-east-2 | 0.120 | 540 |
| us-gov-east-1 | 0.117 | 730 |
| us-gov-west-1 | 0.246 | 1 |
| us-west-1 | 0.226 | 1540 |
| us-west-2 | 0.229 |  |

