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
Updated: 2026-04-05T07:51:51.822861+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.880 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.726 |  |
| ap-northeast-3 | 0.643 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.888 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.790 |  |
| ap-southeast-3 | 0.927 |  |
| ap-southeast-4 | 0.829 |  |
| ap-southeast-5 | 0.895 |  |
| ap-southeast-6 | 0.816 |  |
| ap-southeast-7 | 0.972 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.289 |  |
| eu-central-1 | 0.390 |  |
| eu-central-2 | 0.407 |  |
| eu-north-1 | 0.443 |  |
| eu-south-1 | 0.419 |  |
| eu-south-2 | 0.421 |  |
| eu-west-1 | 0.308 |  |
| eu-west-2 | 0.348 |  |
| eu-west-3 | 0.377 |  |
| il-central-1 | 0.576 |  |
| me-central-1 | 0.769 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.490 |  |
| us-east-1 | 0.062 | 4437 |
| us-east-2 | 0.103 | 1482 |
| us-gov-east-1 | 0.098 | 1628 |
| us-gov-west-1 | 0.292 | 191 |
| us-west-1 | 0.247 | 3356 |
| us-west-2 | 0.299 | 153 |

