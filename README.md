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
Updated: 2026-03-15T09:27:17.183299+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.761 |  |
| ap-east-2 | 0.703 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.607 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.844 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.783 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.424 |  |
| eu-central-2 | 0.447 |  |
| eu-north-1 | 0.475 |  |
| eu-south-1 | 0.460 |  |
| eu-south-2 | 0.470 |  |
| eu-west-1 | 0.350 |  |
| eu-west-2 | 0.384 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.608 |  |
| me-central-1 | 0.833 |  |
| me-south-1 | 0.777 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.095 | 4281 |
| us-east-2 | 0.095 | 1424 |
| us-gov-east-1 | 0.102 | 1577 |
| us-gov-west-1 | 0.258 | 185 |
| us-west-1 | 0.230 | 3234 |
| us-west-2 | 0.259 | 147 |

