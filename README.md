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
Updated: 2026-03-20T06:44:37.677710+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.694 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.517 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.931 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.771 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.787 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.880 |  |
| ca-central-1 | 0.210 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.558 |  |
| eu-south-1 | 0.535 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.446 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.696 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.847 |  |
| mx-central-1 | 0.192 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.172 | 4311 |
| us-east-2 | 0.157 | 1438 |
| us-gov-east-1 | 0.158 | 1590 |
| us-gov-west-1 | 0.199 | 189 |
| us-west-1 | 0.152 | 3265 |
| us-west-2 | 0.187 | 148 |

