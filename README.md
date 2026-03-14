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
Updated: 2026-03-14T15:21:41.498577+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.038 |  |
| ap-east-1 | 0.659 |  |
| ap-east-2 | 0.603 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.590 |  |
| ap-northeast-3 | 0.508 |  |
| ap-south-1 | 0.929 |  |
| ap-south-2 | 0.938 |  |
| ap-southeast-1 | 0.732 |  |
| ap-southeast-2 | 0.634 |  |
| ap-southeast-3 | 0.787 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.752 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.839 |  |
| ca-central-1 | 0.249 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.567 |  |
| eu-north-1 | 0.599 |  |
| eu-south-1 | 0.592 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.477 |  |
| eu-west-2 | 0.511 |  |
| eu-west-3 | 0.526 |  |
| il-central-1 | 0.754 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.881 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.661 |  |
| us-east-1 | 0.217 | 4279 |
| us-east-2 | 0.190 | 1422 |
| us-gov-east-1 | 0.188 | 1575 |
| us-gov-west-1 | 0.139 | 184 |
| us-west-1 | 0.123 | 3228 |
| us-west-2 | 0.141 | 146 |

