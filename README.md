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
Updated: 2026-08-22T21:14:28.481902+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.659 |  |
| ap-east-2 | 0.597 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.586 |  |
| ap-northeast-3 | 0.507 |  |
| ap-south-1 | 0.941 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.738 |  |
| ap-southeast-2 | 0.630 |  |
| ap-southeast-3 | 0.793 |  |
| ap-southeast-4 | 0.677 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.661 |  |
| ap-southeast-7 | 0.843 |  |
| ca-central-1 | 0.268 | 18 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.536 |  |
| eu-central-2 | 0.558 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.571 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.489 |  |
| eu-west-3 | 0.514 |  |
| il-central-1 | 0.697 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.201 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.205 | 5047 |
| us-east-2 | 0.215 | 1681 |
| us-gov-east-1 | 0.193 | 1869 |
| us-gov-west-1 | 0.157 | 225 |
| us-west-1 | 0.099 | 4027 |
| us-west-2 | 0.157 | 184 |

