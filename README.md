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
Updated: 2026-03-08T09:22:38.534444+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.931 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.821 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.842 |  |
| ap-southeast-6 | 0.749 |  |
| ap-southeast-7 | 0.921 |  |
| ca-central-1 | 0.171 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.473 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.483 |  |
| eu-west-1 | 0.375 |  |
| eu-west-2 | 0.413 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.627 |  |
| me-central-1 | 0.850 |  |
| me-south-1 | 0.810 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.552 |  |
| us-east-1 | 0.132 | 4240 |
| us-east-2 | 0.146 | 1408 |
| us-gov-east-1 | 0.148 | 1542 |
| us-gov-west-1 | 0.243 | 174 |
| us-west-1 | 0.182 | 3195 |
| us-west-2 | 0.244 | 143 |

