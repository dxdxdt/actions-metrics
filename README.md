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
Updated: 2025-01-18T15:10:14.671737+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.748 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.672 |  |
| ap-south-1 | 0.857 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.727 |  |
| ca-central-1 | 0.165 | 2 |
| eu-central-1 | 0.469 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.483 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.436 |  |
| me-south-1 | 0.811 |  |
| sa-east-1 | 0.553 |  |
| us-east-1 | 0.121 | 719 |
| us-east-2 | 0.141 | 164 |
| us-gov-east-1 | 0.146 | 160 |
| us-gov-west-1 | 0.258 |  |
| us-west-1 | 0.204 | 464 |
| us-west-2 | 0.266 |  |

