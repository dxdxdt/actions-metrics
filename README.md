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
Updated: 2026-03-22T06:41:35.434965+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.877 |  |
| ap-east-1 | 0.789 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.721 |  |
| ap-northeast-3 | 0.637 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.867 |  |
| ap-southeast-2 | 0.782 |  |
| ap-southeast-3 | 0.929 |  |
| ap-southeast-4 | 0.819 |  |
| ap-southeast-5 | 0.891 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.385 |  |
| eu-central-2 | 0.410 |  |
| eu-north-1 | 0.449 |  |
| eu-south-1 | 0.418 |  |
| eu-south-2 | 0.423 |  |
| eu-west-1 | 0.309 |  |
| eu-west-2 | 0.346 |  |
| eu-west-3 | 0.366 |  |
| il-central-1 | 0.572 |  |
| me-central-1 | 0.779 |  |
| me-south-1 | 0.728 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.500 |  |
| us-east-1 | 0.066 | 4327 |
| us-east-2 | 0.106 | 1446 |
| us-gov-east-1 | 0.104 | 1594 |
| us-gov-west-1 | 0.315 | 189 |
| us-west-1 | 0.257 | 3276 |
| us-west-2 | 0.308 | 151 |

