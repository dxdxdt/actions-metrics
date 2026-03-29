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
Updated: 2026-03-29T12:38:04.653708+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.790 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.709 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.866 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.860 |  |
| ap-southeast-2 | 0.759 |  |
| ap-southeast-3 | 0.922 |  |
| ap-southeast-4 | 0.814 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.810 |  |
| ap-southeast-7 | 0.967 |  |
| ca-central-1 | 0.110 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.435 |  |
| eu-north-1 | 0.473 |  |
| eu-south-1 | 0.437 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.344 |  |
| eu-west-2 | 0.371 |  |
| eu-west-3 | 0.390 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.805 |  |
| me-south-1 | 0.769 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.517 |  |
| us-east-1 | 0.070 | 4389 |
| us-east-2 | 0.080 | 1464 |
| us-gov-east-1 | 0.092 | 1612 |
| us-gov-west-1 | 0.285 | 190 |
| us-west-1 | 0.246 | 3317 |
| us-west-2 | 0.284 | 152 |

