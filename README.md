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
Updated: 2026-04-12T12:43:03.234035+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.924 |  |
| ap-east-1 | 0.761 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.608 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.832 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.888 |  |
| ap-southeast-4 | 0.798 |  |
| ap-southeast-5 | 0.858 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.931 |  |
| ca-central-1 | 0.143 | 16 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.456 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.395 |  |
| eu-west-3 | 0.418 |  |
| il-central-1 | 0.604 |  |
| me-central-1 | 0.814 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.538 |  |
| us-east-1 | 0.097 | 4487 |
| us-east-2 | 0.111 | 1496 |
| us-gov-east-1 | 0.118 | 1643 |
| us-gov-west-1 | 0.255 | 192 |
| us-west-1 | 0.205 | 3400 |
| us-west-2 | 0.266 | 155 |

