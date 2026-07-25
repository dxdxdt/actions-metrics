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
Updated: 2026-07-25T21:45:58.939504+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.746 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.567 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.866 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.721 |  |
| ap-southeast-3 | 0.873 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.847 |  |
| ap-southeast-6 | 0.749 |  |
| ap-southeast-7 | 0.933 |  |
| ca-central-1 | 0.194 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.525 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.505 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.429 |  |
| eu-west-3 | 0.452 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.863 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.570 |  |
| us-east-1 | 0.140 | 4910 |
| us-east-2 | 0.157 | 1665 |
| us-gov-east-1 | 0.154 | 1777 |
| us-gov-west-1 | 0.246 | 207 |
| us-west-1 | 0.188 | 3833 |
| us-west-2 | 0.244 | 170 |

