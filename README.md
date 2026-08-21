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
Updated: 2026-08-21T13:39:11.629098+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.038 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.492 |  |
| ap-northeast-2 | 0.596 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.932 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.656 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.701 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.707 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.288 | 18 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.581 |  |
| eu-north-1 | 0.602 |  |
| eu-south-1 | 0.582 |  |
| eu-south-2 | 0.596 |  |
| eu-west-1 | 0.484 |  |
| eu-west-2 | 0.518 |  |
| eu-west-3 | 0.536 |  |
| il-central-1 | 0.725 |  |
| me-central-1 | 0.941 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.657 |  |
| us-east-1 | 0.220 | 5036 |
| us-east-2 | 0.252 | 1680 |
| us-gov-east-1 | 0.241 | 1865 |
| us-gov-west-1 | 0.187 | 225 |
| us-west-1 | 0.132 | 4012 |
| us-west-2 | 0.185 | 184 |

