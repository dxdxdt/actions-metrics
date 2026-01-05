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
Updated: 2026-01-05T06:27:59.650633+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.031 |  |
| ap-east-1 | 0.673 |  |
| ap-northeast-1 | 0.479 |  |
| ap-northeast-2 | 0.583 |  |
| ap-south-1 | 0.905 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.624 |  |
| ca-central-1 | 0.254 | 15 |
| eu-central-1 | 0.552 |  |
| eu-north-1 | 0.608 |  |
| eu-south-1 | 0.579 |  |
| eu-west-1 | 0.481 |  |
| eu-west-2 | 0.517 |  |
| eu-west-3 | 0.532 |  |
| me-south-1 | 0.881 |  |
| sa-east-1 | 0.663 |  |
| us-east-1 | 0.212 | 3870 |
| us-east-2 | 0.196 | 1210 |
| us-gov-east-1 | 0.201 | 1340 |
| us-gov-west-1 | 0.148 | 109 |
| us-west-1 | 0.101 | 2782 |
| us-west-2 | 0.150 | 90 |

