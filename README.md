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
Updated: 2025-07-08T13:29:33.456510+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.879 |  |
| ap-east-1 | 0.833 |  |
| ap-northeast-1 | 0.637 |  |
| ap-northeast-2 | 0.746 |  |
| ap-south-1 | 0.829 |  |
| ap-southeast-1 | 0.907 |  |
| ap-southeast-2 | 0.768 |  |
| ca-central-1 | 0.115 | 11 |
| eu-central-1 | 0.401 |  |
| eu-north-1 | 0.456 |  |
| eu-south-1 | 0.422 |  |
| eu-west-1 | 0.313 |  |
| eu-west-2 | 0.362 |  |
| eu-west-3 | 0.369 |  |
| me-south-1 | 0.770 |  |
| sa-east-1 | 0.488 |  |
| us-east-1 | 0.066 | 2396 |
| us-east-2 | 0.109 | 577 |
| us-gov-east-1 | 0.108 | 771 |
| us-gov-west-1 | 0.318 | 1 |
| us-west-1 | 0.244 | 1620 |
| us-west-2 | 0.314 |  |

