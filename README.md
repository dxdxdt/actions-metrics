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
Updated: 2026-02-28T07:21:29.060536+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.685 |  |
| ap-east-2 | 0.618 |  |
| ap-northeast-1 | 0.508 |  |
| ap-northeast-2 | 0.612 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.761 |  |
| ap-southeast-2 | 0.646 |  |
| ap-southeast-3 | 0.815 |  |
| ap-southeast-4 | 0.687 |  |
| ap-southeast-5 | 0.778 |  |
| ap-southeast-6 | 0.689 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.233 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.515 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.571 |  |
| eu-south-1 | 0.567 |  |
| eu-south-2 | 0.567 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.914 |  |
| me-south-1 | 0.883 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.191 | 4197 |
| us-east-2 | 0.190 | 1382 |
| us-gov-east-1 | 0.184 | 1518 |
| us-gov-west-1 | 0.169 | 164 |
| us-west-1 | 0.130 | 3139 |
| us-west-2 | 0.169 | 133 |

