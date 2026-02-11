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
Updated: 2026-02-11T22:22:47.503262+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.707 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.629 |  |
| ap-south-1 | 0.914 |  |
| ap-south-2 | 0.972 |  |
| ap-southeast-1 | 0.777 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.833 |  |
| ap-southeast-4 | 0.730 |  |
| ca-central-1 | 0.177 | 16 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.491 |  |
| eu-central-2 | 0.501 |  |
| eu-north-1 | 0.551 |  |
| eu-south-1 | 0.527 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.421 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.477 |  |
| il-central-1 | 0.666 |  |
| me-central-1 | 0.878 |  |
| me-south-1 | 0.868 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.144 | 4106 |
| us-east-2 | 0.138 | 1332 |
| us-gov-east-1 | 0.122 | 1453 |
| us-gov-west-1 | 0.181 | 144 |
| us-west-1 | 0.191 | 3042 |
| us-west-2 | 0.184 | 125 |

