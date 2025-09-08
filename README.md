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
Updated: 2025-09-08T16:14:12.083631+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.054 |  |
| ap-east-1 | 0.669 |  |
| ap-northeast-1 | 0.471 |  |
| ap-northeast-2 | 0.580 |  |
| ap-south-1 | 0.970 |  |
| ap-southeast-1 | 0.730 |  |
| ap-southeast-2 | 0.613 |  |
| ca-central-1 | 0.270 | 13 |
| eu-central-1 | 0.579 |  |
| eu-north-1 | 0.611 |  |
| eu-south-1 | 0.605 |  |
| eu-west-1 | 0.496 |  |
| eu-west-2 | 0.536 |  |
| eu-west-3 | 0.548 |  |
| me-south-1 | 0.921 |  |
| sa-east-1 | 0.682 |  |
| us-east-1 | 0.221 | 3011 |
| us-east-2 | 0.230 | 802 |
| us-gov-east-1 | 0.196 | 920 |
| us-gov-west-1 | 0.130 | 9 |
| us-west-1 | 0.099 | 2002 |
| us-west-2 | 0.128 | 2 |

