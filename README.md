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
Updated: 2026-08-19T15:23:07.272036+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.951 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.670 |  |
| ap-northeast-3 | 0.582 |  |
| ap-south-1 | 0.868 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.808 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.743 |  |
| ap-southeast-5 | 0.828 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.183 | 18 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.507 |  |
| eu-west-1 | 0.388 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.131 | 5022 |
| us-east-2 | 0.149 | 1680 |
| us-gov-east-1 | 0.144 | 1854 |
| us-gov-west-1 | 0.237 | 224 |
| us-west-1 | 0.172 | 3997 |
| us-west-2 | 0.237 | 182 |

