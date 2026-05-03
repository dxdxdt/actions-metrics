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
Updated: 2026-05-03T10:47:22.963538+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.881 |  |
| ap-east-1 | 0.792 |  |
| ap-east-2 | 0.729 |  |
| ap-northeast-1 | 0.613 |  |
| ap-northeast-2 | 0.745 |  |
| ap-northeast-3 | 0.652 |  |
| ap-south-1 | 0.805 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.804 |  |
| ap-southeast-3 | 0.943 |  |
| ap-southeast-4 | 0.849 |  |
| ap-southeast-5 | 0.895 |  |
| ap-southeast-6 | 0.850 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.287 |  |
| eu-central-1 | 0.400 |  |
| eu-central-2 | 0.415 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.429 |  |
| eu-west-1 | 0.313 |  |
| eu-west-2 | 0.351 |  |
| eu-west-3 | 0.372 |  |
| il-central-1 | 0.550 |  |
| me-central-1 | 0.758 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.495 |  |
| us-east-1 | 0.059 | 4590 |
| us-east-2 | 0.084 | 1560 |
| us-gov-east-1 | 0.087 | 1671 |
| us-gov-west-1 | 0.332 | 194 |
| us-west-1 | 0.268 | 3522 |
| us-west-2 | 0.330 | 157 |

