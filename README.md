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
Updated: 2026-03-07T19:17:02.046716+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.931 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.706 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.610 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.751 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.790 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.794 |  |
| ap-southeast-7 | 0.940 |  |
| ca-central-1 | 0.116 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.480 |  |
| eu-south-1 | 0.460 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.390 |  |
| eu-west-3 | 0.414 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.811 |  |
| me-south-1 | 0.768 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.531 |  |
| us-east-1 | 0.088 | 4236 |
| us-east-2 | 0.082 | 1407 |
| us-gov-east-1 | 0.079 | 1540 |
| us-gov-west-1 | 0.239 | 174 |
| us-west-1 | 0.243 | 3191 |
| us-west-2 | 0.241 | 143 |

