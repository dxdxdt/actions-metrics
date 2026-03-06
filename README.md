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
Updated: 2026-03-06T17:29:22.123560+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.029 |  |
| ap-east-1 | 0.683 |  |
| ap-east-2 | 0.618 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.611 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.754 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.809 |  |
| ap-southeast-4 | 0.686 |  |
| ap-southeast-5 | 0.773 |  |
| ap-southeast-6 | 0.693 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.239 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.543 |  |
| eu-central-2 | 0.566 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.551 |  |
| eu-south-2 | 0.569 |  |
| eu-west-1 | 0.458 |  |
| eu-west-2 | 0.487 |  |
| eu-west-3 | 0.521 |  |
| il-central-1 | 0.720 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.881 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.656 |  |
| us-east-1 | 0.196 | 4232 |
| us-east-2 | 0.173 | 1403 |
| us-gov-east-1 | 0.174 | 1532 |
| us-gov-west-1 | 0.162 | 173 |
| us-west-1 | 0.130 | 3185 |
| us-west-2 | 0.162 | 142 |

