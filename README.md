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
Updated: 2026-03-19T15:45:06.428569+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.659 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.713 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.764 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.162 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.511 |  |
| eu-north-1 | 0.541 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.544 |  |
| eu-west-1 | 0.427 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.480 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.864 |  |
| me-south-1 | 0.832 |  |
| mx-central-1 | 0.259 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.132 | 4309 |
| us-east-2 | 0.128 | 1437 |
| us-gov-east-1 | 0.124 | 1588 |
| us-gov-west-1 | 0.226 | 189 |
| us-west-1 | 0.172 | 3258 |
| us-west-2 | 0.220 | 148 |

