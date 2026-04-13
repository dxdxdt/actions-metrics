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
Updated: 2026-04-13T23:37:09.038030+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.887 |  |
| ap-east-1 | 0.793 |  |
| ap-east-2 | 0.742 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.718 |  |
| ap-northeast-3 | 0.643 |  |
| ap-south-1 | 0.846 |  |
| ap-south-2 | 0.880 |  |
| ap-southeast-1 | 0.867 |  |
| ap-southeast-2 | 0.801 |  |
| ap-southeast-3 | 0.920 |  |
| ap-southeast-4 | 0.836 |  |
| ap-southeast-5 | 0.892 |  |
| ap-southeast-6 | 0.824 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.119 | 16 |
| ca-west-1 | 0.292 |  |
| eu-central-1 | 0.393 |  |
| eu-central-2 | 0.410 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.413 |  |
| eu-south-2 | 0.427 |  |
| eu-west-1 | 0.310 |  |
| eu-west-2 | 0.349 |  |
| eu-west-3 | 0.380 |  |
| il-central-1 | 0.558 |  |
| me-central-1 | 0.766 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.492 |  |
| us-east-1 | 0.062 | 4496 |
| us-east-2 | 0.101 | 1499 |
| us-gov-east-1 | 0.106 | 1646 |
| us-gov-west-1 | 0.306 | 193 |
| us-west-1 | 0.265 | 3409 |
| us-west-2 | 0.298 | 155 |

