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
Updated: 2026-06-10T20:15:44.180885+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.788 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.611 |  |
| ap-northeast-2 | 0.721 |  |
| ap-northeast-3 | 0.636 |  |
| ap-south-1 | 0.827 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.863 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.916 |  |
| ap-southeast-4 | 0.809 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.804 |  |
| ap-southeast-7 | 0.973 |  |
| ca-central-1 | 0.137 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.409 |  |
| eu-central-2 | 0.433 |  |
| eu-north-1 | 0.455 |  |
| eu-south-1 | 0.445 |  |
| eu-south-2 | 0.442 |  |
| eu-west-1 | 0.326 |  |
| eu-west-2 | 0.365 |  |
| eu-west-3 | 0.387 |  |
| il-central-1 | 0.561 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.084 | 4741 |
| us-east-2 | 0.116 | 1630 |
| us-gov-east-1 | 0.119 | 1710 |
| us-gov-west-1 | 0.298 | 198 |
| us-west-1 | 0.248 | 3655 |
| us-west-2 | 0.299 | 162 |

