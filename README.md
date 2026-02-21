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
Updated: 2026-02-21T21:16:08.139579+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.013 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.505 |  |
| ap-northeast-2 | 0.611 |  |
| ap-northeast-3 | 0.530 |  |
| ap-south-1 | 0.928 |  |
| ap-south-2 | 0.955 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.661 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.704 |  |
| ap-southeast-5 | 0.778 |  |
| ap-southeast-6 | 0.704 |  |
| ap-southeast-7 | 0.862 |  |
| ca-central-1 | 0.217 | 16 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.522 |  |
| eu-central-2 | 0.537 |  |
| eu-north-1 | 0.580 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.556 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.479 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.902 |  |
| me-south-1 | 0.858 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.178 | 4159 |
| us-east-2 | 0.149 | 1364 |
| us-gov-east-1 | 0.166 | 1498 |
| us-gov-west-1 | 0.168 | 160 |
| us-west-1 | 0.150 | 3095 |
| us-west-2 | 0.167 | 129 |

