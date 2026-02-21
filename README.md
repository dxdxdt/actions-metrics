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
Updated: 2026-02-21T20:16:51.531815+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.044 |  |
| ap-east-1 | 0.647 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.464 |  |
| ap-northeast-2 | 0.570 |  |
| ap-northeast-3 | 0.490 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.722 |  |
| ap-southeast-2 | 0.613 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.653 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.661 |  |
| ap-southeast-7 | 0.825 |  |
| ca-central-1 | 0.290 | 16 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.570 |  |
| eu-central-2 | 0.570 |  |
| eu-north-1 | 0.619 |  |
| eu-south-1 | 0.587 |  |
| eu-south-2 | 0.589 |  |
| eu-west-1 | 0.476 |  |
| eu-west-2 | 0.522 |  |
| eu-west-3 | 0.548 |  |
| il-central-1 | 0.738 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.903 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.672 |  |
| us-east-1 | 0.223 | 4159 |
| us-east-2 | 0.213 | 1363 |
| us-gov-east-1 | 0.212 | 1498 |
| us-gov-west-1 | 0.141 | 160 |
| us-west-1 | 0.086 | 3095 |
| us-west-2 | 0.143 | 129 |

