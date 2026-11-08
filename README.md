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
Updated: 2026-11-08T10:56:51.468855+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.702 |  |
| ap-east-1 | 0.561 |  |
| ap-east-2 | 0.518 |  |
| ap-northeast-1 | 0.426 |  |
| ap-northeast-2 | 0.506 |  |
| ap-northeast-3 | 0.447 |  |
| ap-south-1 | 0.661 |  |
| ap-south-2 | 0.744 |  |
| ap-southeast-1 | 0.619 |  |
| ap-southeast-2 | 0.542 |  |
| ap-southeast-3 | 0.663 |  |
| ap-southeast-4 | 0.605 |  |
| ap-southeast-5 | 0.633 |  |
| ap-southeast-6 | 0.562 |  |
| ap-southeast-7 | 0.697 |  |
| ca-central-1 | 0.101 | 18 |
| ca-west-1 | 0.155 |  |
| eu-central-1 | 0.351 |  |
| eu-central-2 | 0.355 |  |
| eu-north-1 | 0.376 |  |
| eu-south-1 | 0.350 |  |
| eu-south-2 | 0.344 |  |
| eu-west-1 | 0.281 |  |
| eu-west-2 | 0.309 |  |
| eu-west-3 | 0.331 |  |
| il-central-1 | 0.466 |  |
| me-central-1 | 0.608 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.155 |  |
| sa-east-1 | 0.427 |  |
| us-east-1 | 0.085 | 5178 |
| us-east-2 | 0.075 | 1722 |
| us-gov-east-1 | 0.094 | 1959 |
| us-gov-west-1 | 0.185 | 245 |
| us-west-1 | 0.143 | 4210 |
| us-west-2 | 0.185 | 196 |

