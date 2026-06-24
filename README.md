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
Updated: 2026-06-24T22:09:54.370064+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.652 |  |
| ap-east-2 | 0.588 |  |
| ap-northeast-1 | 0.471 |  |
| ap-northeast-2 | 0.575 |  |
| ap-northeast-3 | 0.497 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.725 |  |
| ap-southeast-2 | 0.612 |  |
| ap-southeast-3 | 0.782 |  |
| ap-southeast-4 | 0.657 |  |
| ap-southeast-5 | 0.744 |  |
| ap-southeast-6 | 0.647 |  |
| ap-southeast-7 | 0.830 |  |
| ca-central-1 | 0.278 | 16 |
| ca-west-1 | 0.195 |  |
| eu-central-1 | 0.557 |  |
| eu-central-2 | 0.588 |  |
| eu-north-1 | 0.606 |  |
| eu-south-1 | 0.592 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.489 |  |
| eu-west-2 | 0.519 |  |
| eu-west-3 | 0.531 |  |
| il-central-1 | 0.718 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.668 |  |
| us-east-1 | 0.223 | 4786 |
| us-east-2 | 0.223 | 1640 |
| us-gov-east-1 | 0.211 | 1720 |
| us-gov-west-1 | 0.143 | 199 |
| us-west-1 | 0.083 | 3700 |
| us-west-2 | 0.142 | 163 |

