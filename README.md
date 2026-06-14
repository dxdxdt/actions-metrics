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
Updated: 2026-06-14T04:45:37.507006+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.855 |  |
| ap-east-1 | 0.829 |  |
| ap-east-2 | 0.764 |  |
| ap-northeast-1 | 0.645 |  |
| ap-northeast-2 | 0.754 |  |
| ap-northeast-3 | 0.669 |  |
| ap-south-1 | 0.806 |  |
| ap-south-2 | 0.859 |  |
| ap-southeast-1 | 0.897 |  |
| ap-southeast-2 | 0.793 |  |
| ap-southeast-3 | 0.953 |  |
| ap-southeast-4 | 0.853 |  |
| ap-southeast-5 | 0.923 |  |
| ap-southeast-6 | 0.839 |  |
| ap-southeast-7 | 1.001 |  |
| ca-central-1 | 0.098 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.369 |  |
| eu-central-2 | 0.391 |  |
| eu-north-1 | 0.414 |  |
| eu-south-1 | 0.395 |  |
| eu-south-2 | 0.400 |  |
| eu-west-1 | 0.285 |  |
| eu-west-2 | 0.322 |  |
| eu-west-3 | 0.353 |  |
| il-central-1 | 0.526 |  |
| me-central-1 | 0.727 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.250 |  |
| sa-east-1 | 0.470 |  |
| us-east-1 | 0.041 | 4757 |
| us-east-2 | 0.085 | 1633 |
| us-gov-east-1 | 0.087 | 1712 |
| us-gov-west-1 | 0.323 | 198 |
| us-west-1 | 0.272 | 3661 |
| us-west-2 | 0.322 | 163 |

