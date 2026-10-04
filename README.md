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
Updated: 2026-10-04T17:20:11.667979+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.036 |  |
| ap-east-1 | 0.643 |  |
| ap-east-2 | 0.584 |  |
| ap-northeast-1 | 0.467 |  |
| ap-northeast-2 | 0.565 |  |
| ap-northeast-3 | 0.492 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.855 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.644 |  |
| ap-southeast-3 | 0.777 |  |
| ap-southeast-4 | 0.691 |  |
| ap-southeast-5 | 0.741 |  |
| ap-southeast-6 | 0.681 |  |
| ap-southeast-7 | 0.825 |  |
| ca-central-1 | 0.249 | 18 |
| ca-west-1 | 0.195 |  |
| eu-central-1 | 0.536 |  |
| eu-central-2 | 0.551 |  |
| eu-north-1 | 0.588 |  |
| eu-south-1 | 0.564 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.454 |  |
| eu-west-2 | 0.487 |  |
| eu-west-3 | 0.521 |  |
| il-central-1 | 0.700 |  |
| me-central-1 | 0.922 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.663 |  |
| us-east-1 | 0.214 | 5137 |
| us-east-2 | 0.196 | 1690 |
| us-gov-east-1 | 0.217 | 1932 |
| us-gov-west-1 | 0.142 | 237 |
| us-west-1 | 0.138 | 4155 |
| us-west-2 | 0.140 | 193 |

