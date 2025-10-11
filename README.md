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
Updated: 2025-10-11T16:13:26.265681+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.983 |  |
| ap-east-1 | 0.765 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.675 |  |
| ap-south-1 | 0.948 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.704 |  |
| ca-central-1 | 0.178 | 15 |
| eu-central-1 | 0.483 |  |
| eu-north-1 | 0.513 |  |
| eu-south-1 | 0.491 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.463 |  |
| me-south-1 | 0.780 |  |
| sa-east-1 | 0.566 |  |
| us-east-1 | 0.127 | 3268 |
| us-east-2 | 0.137 | 890 |
| us-gov-east-1 | 0.146 | 1072 |
| us-gov-west-1 | 0.227 | 50 |
| us-west-1 | 0.183 | 2197 |
| us-west-2 | 0.225 | 20 |

