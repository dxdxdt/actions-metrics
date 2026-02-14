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
Updated: 2026-02-14T21:17:32.142294+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.936 |  |
| ap-east-1 | 0.761 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.680 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.128 | 16 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.447 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.477 |  |
| eu-south-2 | 0.484 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.431 |  |
| il-central-1 | 0.618 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.784 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.103 | 4122 |
| us-east-2 | 0.099 | 1340 |
| us-gov-east-1 | 0.095 | 1468 |
| us-gov-west-1 | 0.235 | 147 |
| us-west-1 | 0.232 | 3060 |
| us-west-2 | 0.234 | 125 |

