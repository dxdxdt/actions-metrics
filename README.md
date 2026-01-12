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
Updated: 2026-01-12T21:14:12.506824+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.058 |  |
| ap-east-1 | 0.666 |  |
| ap-northeast-1 | 0.476 |  |
| ap-northeast-2 | 0.580 |  |
| ap-south-1 | 0.899 |  |
| ap-southeast-1 | 0.778 |  |
| ap-southeast-2 | 0.604 |  |
| ca-central-1 | 0.296 | 16 |
| eu-central-1 | 0.578 |  |
| eu-north-1 | 0.606 |  |
| eu-south-1 | 0.603 |  |
| eu-west-1 | 0.489 |  |
| eu-west-2 | 0.530 |  |
| eu-west-3 | 0.565 |  |
| me-south-1 | 0.900 |  |
| sa-east-1 | 0.686 |  |
| us-east-1 | 0.249 | 3919 |
| us-east-2 | 0.217 | 1234 |
| us-gov-east-1 | 0.221 | 1360 |
| us-gov-west-1 | 0.165 | 111 |
| us-west-1 | 0.077 | 2842 |
| us-west-2 | 0.170 | 103 |

