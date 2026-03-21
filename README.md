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
Updated: 2026-03-21T11:17:43.164987+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.806 |  |
| ap-east-2 | 0.748 |  |
| ap-northeast-1 | 0.622 |  |
| ap-northeast-2 | 0.735 |  |
| ap-northeast-3 | 0.654 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.799 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.840 |  |
| ap-southeast-5 | 0.902 |  |
| ap-southeast-6 | 0.830 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.307 |  |
| eu-central-1 | 0.382 |  |
| eu-central-2 | 0.402 |  |
| eu-north-1 | 0.436 |  |
| eu-south-1 | 0.411 |  |
| eu-south-2 | 0.413 |  |
| eu-west-1 | 0.303 |  |
| eu-west-2 | 0.336 |  |
| eu-west-3 | 0.361 |  |
| il-central-1 | 0.564 |  |
| me-central-1 | 0.761 |  |
| me-south-1 | 0.730 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.484 |  |
| us-east-1 | 0.054 | 4322 |
| us-east-2 | 0.086 | 1445 |
| us-gov-east-1 | 0.092 | 1591 |
| us-gov-west-1 | 0.314 | 189 |
| us-west-1 | 0.269 | 3271 |
| us-west-2 | 0.318 | 149 |

