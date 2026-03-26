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
Updated: 2026-03-26T19:52:13.939956+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.717 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.631 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.854 |  |
| ap-southeast-2 | 0.760 |  |
| ap-southeast-3 | 0.916 |  |
| ap-southeast-4 | 0.807 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.965 |  |
| ca-central-1 | 0.140 | 16 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.417 |  |
| eu-central-2 | 0.434 |  |
| eu-north-1 | 0.472 |  |
| eu-south-1 | 0.437 |  |
| eu-south-2 | 0.497 |  |
| eu-west-1 | 0.333 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.392 |  |
| il-central-1 | 0.579 |  |
| me-central-1 | 0.781 |  |
| me-south-1 | 0.744 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.518 |  |
| us-east-1 | 0.082 | 4365 |
| us-east-2 | 0.113 | 1456 |
| us-gov-east-1 | 0.111 | 1606 |
| us-gov-west-1 | 0.286 | 190 |
| us-west-1 | 0.228 | 3303 |
| us-west-2 | 0.279 | 151 |

