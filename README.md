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
Updated: 2025-09-26T03:27:47.092654+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.890 |  |
| ap-east-1 | 0.811 |  |
| ap-northeast-1 | 0.612 |  |
| ap-northeast-2 | 0.720 |  |
| ap-south-1 | 0.843 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.774 |  |
| ca-central-1 | 0.102 | 15 |
| eu-central-1 | 0.411 |  |
| eu-north-1 | 0.449 |  |
| eu-south-1 | 0.421 |  |
| eu-west-1 | 0.318 |  |
| eu-west-2 | 0.358 |  |
| eu-west-3 | 0.379 |  |
| me-south-1 | 0.711 |  |
| sa-east-1 | 0.499 |  |
| us-east-1 | 0.066 | 3161 |
| us-east-2 | 0.096 | 810 |
| us-gov-east-1 | 0.101 | 1018 |
| us-gov-west-1 | 0.286 | 36 |
| us-west-1 | 0.243 | 2102 |
| us-west-2 | 0.285 | 15 |

