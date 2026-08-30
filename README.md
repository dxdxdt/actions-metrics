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
Updated: 2026-08-30T18:19:11.153844+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.997 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.956 |  |
| ap-south-2 | 0.991 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.773 |  |
| ap-southeast-6 | 0.685 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.226 | 18 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.507 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.525 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.433 |  |
| eu-west-2 | 0.464 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.663 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.191 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.177 | 5074 |
| us-east-2 | 0.176 | 1684 |
| us-gov-east-1 | 0.170 | 1891 |
| us-gov-west-1 | 0.174 | 228 |
| us-west-1 | 0.118 | 4070 |
| us-west-2 | 0.174 | 189 |

