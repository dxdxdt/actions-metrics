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
Updated: 2026-03-20T16:34:48.699425+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.787 |  |
| ap-east-2 | 0.730 |  |
| ap-northeast-1 | 0.611 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.634 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.888 |  |
| ap-southeast-1 | 0.864 |  |
| ap-southeast-2 | 0.792 |  |
| ap-southeast-3 | 0.919 |  |
| ap-southeast-4 | 0.856 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.847 |  |
| ap-southeast-7 | 0.968 |  |
| ca-central-1 | 0.111 | 16 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.425 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.428 |  |
| eu-south-2 | 0.445 |  |
| eu-west-1 | 0.337 |  |
| eu-west-2 | 0.362 |  |
| eu-west-3 | 0.389 |  |
| il-central-1 | 0.571 |  |
| me-central-1 | 0.782 |  |
| me-south-1 | 0.744 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.504 |  |
| us-east-1 | 0.067 | 4316 |
| us-east-2 | 0.090 | 1440 |
| us-gov-east-1 | 0.088 | 1591 |
| us-gov-west-1 | 0.294 | 189 |
| us-west-1 | 0.265 | 3267 |
| us-west-2 | 0.295 | 148 |

