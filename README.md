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
Updated: 2026-06-27T21:57:06.678378+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.877 |  |
| ap-east-1 | 0.801 |  |
| ap-east-2 | 0.743 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.829 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.930 |  |
| ap-southeast-4 | 0.820 |  |
| ap-southeast-5 | 0.897 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.100 | 16 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.393 |  |
| eu-central-2 | 0.414 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.433 |  |
| eu-south-2 | 0.432 |  |
| eu-west-1 | 0.317 |  |
| eu-west-2 | 0.349 |  |
| eu-west-3 | 0.372 |  |
| il-central-1 | 0.542 |  |
| me-central-1 | 0.764 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.506 |  |
| us-east-1 | 0.057 | 4794 |
| us-east-2 | 0.074 | 1644 |
| us-gov-east-1 | 0.075 | 1723 |
| us-gov-west-1 | 0.295 | 199 |
| us-west-1 | 0.239 | 3713 |
| us-west-2 | 0.294 | 163 |

