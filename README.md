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
Updated: 2025-09-15T15:13:49.130815+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.778 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.686 |  |
| ap-south-1 | 0.935 |  |
| ap-southeast-1 | 0.840 |  |
| ap-southeast-2 | 0.748 |  |
| ca-central-1 | 0.107 | 14 |
| eu-central-1 | 0.431 |  |
| eu-north-1 | 0.469 |  |
| eu-south-1 | 0.447 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.387 |  |
| eu-west-3 | 0.418 |  |
| me-south-1 | 0.802 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.081 | 3081 |
| us-east-2 | 0.116 | 804 |
| us-gov-east-1 | 0.084 | 946 |
| us-gov-west-1 | 0.239 | 19 |
| us-west-1 | 0.232 | 2047 |
| us-west-2 | 0.239 | 7 |

