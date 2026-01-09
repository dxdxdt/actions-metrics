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
Updated: 2026-01-09T08:20:58.610168+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.932 |  |
| ap-east-1 | 0.761 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.679 |  |
| ap-south-1 | 0.877 |  |
| ap-southeast-1 | 0.887 |  |
| ap-southeast-2 | 0.717 |  |
| ca-central-1 | 0.173 | 16 |
| eu-central-1 | 0.455 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.476 |  |
| eu-west-1 | 0.364 |  |
| eu-west-2 | 0.408 |  |
| eu-west-3 | 0.431 |  |
| me-south-1 | 0.764 |  |
| sa-east-1 | 0.557 |  |
| us-east-1 | 0.128 | 3898 |
| us-east-2 | 0.138 | 1222 |
| us-gov-east-1 | 0.133 | 1352 |
| us-gov-west-1 | 0.239 | 109 |
| us-west-1 | 0.194 | 2808 |
| us-west-2 | 0.229 | 101 |

