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
Updated: 2026-04-04T20:22:44.794077+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.676 |  |
| ap-east-2 | 0.622 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.757 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.685 |  |
| ap-southeast-5 | 0.773 |  |
| ap-southeast-6 | 0.689 |  |
| ap-southeast-7 | 0.855 |  |
| ca-central-1 | 0.218 | 16 |
| ca-west-1 | 0.200 |  |
| eu-central-1 | 0.541 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.582 |  |
| eu-west-1 | 0.467 |  |
| eu-west-2 | 0.502 |  |
| eu-west-3 | 0.513 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.902 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.652 |  |
| us-east-1 | 0.185 | 4434 |
| us-east-2 | 0.162 | 1481 |
| us-gov-east-1 | 0.159 | 1627 |
| us-gov-west-1 | 0.166 | 191 |
| us-west-1 | 0.117 | 3354 |
| us-west-2 | 0.168 | 153 |

