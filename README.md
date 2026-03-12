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
Updated: 2026-03-12T09:36:09.729887+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.879 |  |
| ap-east-1 | 0.811 |  |
| ap-east-2 | 0.750 |  |
| ap-northeast-1 | 0.634 |  |
| ap-northeast-2 | 0.746 |  |
| ap-northeast-3 | 0.657 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.889 |  |
| ap-southeast-2 | 0.794 |  |
| ap-southeast-3 | 0.931 |  |
| ap-southeast-4 | 0.853 |  |
| ap-southeast-5 | 0.906 |  |
| ap-southeast-6 | 0.843 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.108 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.384 |  |
| eu-central-2 | 0.403 |  |
| eu-north-1 | 0.437 |  |
| eu-south-1 | 0.408 |  |
| eu-south-2 | 0.418 |  |
| eu-west-1 | 0.300 |  |
| eu-west-2 | 0.342 |  |
| eu-west-3 | 0.369 |  |
| il-central-1 | 0.553 |  |
| me-central-1 | 0.766 |  |
| me-south-1 | 0.724 |  |
| mx-central-1 | 0.277 |  |
| sa-east-1 | 0.483 |  |
| us-east-1 | 0.054 | 4264 |
| us-east-2 | 0.086 | 1419 |
| us-gov-east-1 | 0.093 | 1565 |
| us-gov-west-1 | 0.323 | 180 |
| us-west-1 | 0.274 | 3214 |
| us-west-2 | 0.325 | 144 |

