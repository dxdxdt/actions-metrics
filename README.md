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
Updated: 2026-06-15T22:58:58.739231+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.983 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.501 |  |
| ap-northeast-2 | 0.602 |  |
| ap-northeast-3 | 0.527 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.757 |  |
| ap-southeast-2 | 0.657 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.706 |  |
| ap-southeast-5 | 0.780 |  |
| ap-southeast-6 | 0.701 |  |
| ap-southeast-7 | 0.860 |  |
| ca-central-1 | 0.238 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.517 |  |
| eu-central-2 | 0.533 |  |
| eu-north-1 | 0.548 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.533 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.911 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.173 | 4760 |
| us-east-2 | 0.194 | 1634 |
| us-gov-east-1 | 0.180 | 1713 |
| us-gov-west-1 | 0.191 | 198 |
| us-west-1 | 0.138 | 3670 |
| us-west-2 | 0.192 | 163 |

