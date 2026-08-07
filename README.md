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
Updated: 2026-08-07T15:46:38.446023+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.953 |  |
| ap-east-1 | 0.724 |  |
| ap-east-2 | 0.663 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.650 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.799 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.820 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.151 | 18 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.482 |  |
| eu-north-1 | 0.498 |  |
| eu-south-1 | 0.483 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.427 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.848 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.574 |  |
| us-east-1 | 0.117 | 4949 |
| us-east-2 | 0.119 | 1675 |
| us-gov-east-1 | 0.098 | 1808 |
| us-gov-west-1 | 0.223 | 211 |
| us-west-1 | 0.165 | 3894 |
| us-west-2 | 0.222 | 172 |

