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
Updated: 2026-03-20T07:41:34.389924+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.932 |  |
| ap-east-1 | 0.759 |  |
| ap-east-2 | 0.701 |  |
| ap-northeast-1 | 0.572 |  |
| ap-northeast-2 | 0.692 |  |
| ap-northeast-3 | 0.604 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.745 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.802 |  |
| ap-southeast-5 | 0.847 |  |
| ap-southeast-6 | 0.788 |  |
| ap-southeast-7 | 0.943 |  |
| ca-central-1 | 0.155 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.436 |  |
| eu-central-2 | 0.465 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.475 |  |
| eu-west-1 | 0.375 |  |
| eu-west-2 | 0.406 |  |
| eu-west-3 | 0.421 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.782 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.553 |  |
| us-east-1 | 0.111 | 4312 |
| us-east-2 | 0.127 | 1438 |
| us-gov-east-1 | 0.127 | 1590 |
| us-gov-west-1 | 0.281 | 189 |
| us-west-1 | 0.230 | 3265 |
| us-west-2 | 0.260 | 148 |

