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
Updated: 2026-06-19T12:50:34.313520+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.881 |  |
| ap-east-1 | 0.798 |  |
| ap-east-2 | 0.736 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.644 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.808 |  |
| ap-southeast-5 | 0.911 |  |
| ap-southeast-6 | 0.798 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.132 | 16 |
| ca-west-1 | 0.283 |  |
| eu-central-1 | 0.406 |  |
| eu-central-2 | 0.432 |  |
| eu-north-1 | 0.463 |  |
| eu-south-1 | 0.447 |  |
| eu-south-2 | 0.435 |  |
| eu-west-1 | 0.326 |  |
| eu-west-2 | 0.365 |  |
| eu-west-3 | 0.381 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.808 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.506 |  |
| us-east-1 | 0.079 | 4773 |
| us-east-2 | 0.120 | 1635 |
| us-gov-east-1 | 0.115 | 1714 |
| us-gov-west-1 | 0.286 | 198 |
| us-west-1 | 0.228 | 3679 |
| us-west-2 | 0.290 | 163 |

