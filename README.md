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
Updated: 2026-02-11T12:51:12.898801+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.867 |  |
| ap-east-1 | 0.819 |  |
| ap-northeast-1 | 0.626 |  |
| ap-northeast-2 | 0.760 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.891 |  |
| ap-southeast-2 | 0.806 |  |
| ap-southeast-3 | 0.948 |  |
| ap-southeast-4 | 0.826 |  |
| ca-central-1 | 0.110 | 16 |
| ca-west-1 | 0.290 |  |
| eu-central-1 | 0.374 |  |
| eu-central-2 | 0.394 |  |
| eu-north-1 | 0.422 |  |
| eu-south-1 | 0.403 |  |
| eu-south-2 | 0.411 |  |
| eu-west-1 | 0.301 |  |
| eu-west-2 | 0.333 |  |
| eu-west-3 | 0.352 |  |
| il-central-1 | 0.544 |  |
| me-central-1 | 0.777 |  |
| me-south-1 | 0.738 |  |
| sa-east-1 | 0.480 |  |
| us-east-1 | 0.051 | 4104 |
| us-east-2 | 0.100 | 1331 |
| us-gov-east-1 | 0.099 | 1451 |
| us-gov-west-1 | 0.321 | 143 |
| us-west-1 | 0.262 | 3039 |
| us-west-2 | 0.325 | 125 |

