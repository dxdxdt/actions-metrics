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
Updated: 2026-05-20T13:33:16.633467+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.876 |  |
| ap-east-1 | 0.830 |  |
| ap-east-2 | 0.754 |  |
| ap-northeast-1 | 0.622 |  |
| ap-northeast-2 | 0.750 |  |
| ap-northeast-3 | 0.663 |  |
| ap-south-1 | 0.828 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.896 |  |
| ap-southeast-2 | 0.809 |  |
| ap-southeast-3 | 0.936 |  |
| ap-southeast-4 | 0.837 |  |
| ap-southeast-5 | 0.911 |  |
| ap-southeast-6 | 0.864 |  |
| ap-southeast-7 | 1.004 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.274 |  |
| eu-central-1 | 0.390 |  |
| eu-central-2 | 0.407 |  |
| eu-north-1 | 0.432 |  |
| eu-south-1 | 0.415 |  |
| eu-south-2 | 0.423 |  |
| eu-west-1 | 0.306 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.370 |  |
| il-central-1 | 0.550 |  |
| me-central-1 | 0.787 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.494 |  |
| us-east-1 | 0.059 | 4667 |
| us-east-2 | 0.099 | 1603 |
| us-gov-east-1 | 0.103 | 1699 |
| us-gov-west-1 | 0.323 | 195 |
| us-west-1 | 0.266 | 3581 |
| us-west-2 | 0.324 | 158 |

