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
Updated: 2026-07-03T17:16:04.825291+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.559 |  |
| ap-northeast-2 | 0.659 |  |
| ap-northeast-3 | 0.582 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.726 |  |
| ap-southeast-3 | 0.863 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.832 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.132 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.463 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.492 |  |
| eu-south-2 | 0.495 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.414 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.846 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.112 | 4813 |
| us-east-2 | 0.082 | 1652 |
| us-gov-east-1 | 0.087 | 1728 |
| us-gov-west-1 | 0.236 | 200 |
| us-west-1 | 0.176 | 3734 |
| us-west-2 | 0.230 | 164 |

