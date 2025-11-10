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
Updated: 2025-11-10T18:19:36.894531+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.075 |  |
| ap-east-1 | 0.661 |  |
| ap-northeast-1 | 0.462 |  |
| ap-northeast-2 | 0.573 |  |
| ap-south-1 | 0.908 |  |
| ap-southeast-1 | 0.718 |  |
| ap-southeast-2 | 0.603 |  |
| ca-central-1 | 0.281 | 15 |
| eu-central-1 | 0.593 |  |
| eu-north-1 | 0.639 |  |
| eu-south-1 | 0.607 |  |
| eu-west-1 | 0.502 |  |
| eu-west-2 | 0.538 |  |
| eu-west-3 | 0.573 |  |
| me-south-1 | 0.908 |  |
| sa-east-1 | 0.693 |  |
| us-east-1 | 0.243 | 3477 |
| us-east-2 | 0.207 | 1033 |
| us-gov-east-1 | 0.204 | 1157 |
| us-gov-west-1 | 0.117 | 74 |
| us-west-1 | 0.087 | 2403 |
| us-west-2 | 0.121 | 30 |

