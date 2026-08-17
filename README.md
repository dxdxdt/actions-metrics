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
Updated: 2026-08-17T04:33:34.449497+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.931 |  |
| ap-south-2 | 0.963 |  |
| ap-southeast-1 | 0.778 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.838 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.210 | 18 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.523 |  |
| eu-west-1 | 0.410 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.860 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.166 | 5010 |
| us-east-2 | 0.179 | 1680 |
| us-gov-east-1 | 0.160 | 1835 |
| us-gov-west-1 | 0.202 | 224 |
| us-west-1 | 0.141 | 3973 |
| us-west-2 | 0.202 | 180 |

