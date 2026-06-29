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
Updated: 2026-06-29T05:24:55.354209+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.877 |  |
| ap-east-1 | 0.794 |  |
| ap-east-2 | 0.735 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.727 |  |
| ap-northeast-3 | 0.646 |  |
| ap-south-1 | 0.831 |  |
| ap-south-2 | 0.880 |  |
| ap-southeast-1 | 0.869 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.820 |  |
| ap-southeast-5 | 0.885 |  |
| ap-southeast-6 | 0.811 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.108 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.393 |  |
| eu-central-2 | 0.414 |  |
| eu-north-1 | 0.440 |  |
| eu-south-1 | 0.419 |  |
| eu-south-2 | 0.429 |  |
| eu-west-1 | 0.311 |  |
| eu-west-2 | 0.350 |  |
| eu-west-3 | 0.376 |  |
| il-central-1 | 0.547 |  |
| me-central-1 | 0.780 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.504 |  |
| us-east-1 | 0.066 | 4802 |
| us-east-2 | 0.094 | 1646 |
| us-gov-east-1 | 0.098 | 1723 |
| us-gov-west-1 | 0.291 | 199 |
| us-west-1 | 0.239 | 3718 |
| us-west-2 | 0.290 | 163 |

