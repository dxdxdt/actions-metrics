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
Updated: 2026-04-20T15:12:11.262916+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.955 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.567 |  |
| ap-northeast-2 | 0.673 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.973 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.720 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.767 |  |
| ap-southeast-5 | 0.840 |  |
| ap-southeast-6 | 0.797 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.166 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.447 |  |
| il-central-1 | 0.645 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.120 | 4531 |
| us-east-2 | 0.096 | 1519 |
| us-gov-east-1 | 0.121 | 1657 |
| us-gov-west-1 | 0.239 | 194 |
| us-west-1 | 0.178 | 3448 |
| us-west-2 | 0.234 | 156 |

