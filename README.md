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
Updated: 2026-03-03T21:27:36.070223+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.922 |  |
| ap-east-1 | 0.784 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.618 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.917 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.154 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.424 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.486 |  |
| eu-south-1 | 0.461 |  |
| eu-south-2 | 0.461 |  |
| eu-west-1 | 0.356 |  |
| eu-west-2 | 0.387 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.608 |  |
| me-central-1 | 0.809 |  |
| me-south-1 | 0.782 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.101 | 4214 |
| us-east-2 | 0.134 | 1396 |
| us-gov-east-1 | 0.130 | 1527 |
| us-gov-west-1 | 0.268 | 169 |
| us-west-1 | 0.210 | 3167 |
| us-west-2 | 0.268 | 137 |

