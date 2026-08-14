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
Updated: 2026-08-14T23:14:23.699515+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.743 |  |
| ap-southeast-7 | 0.917 |  |
| ca-central-1 | 0.172 | 18 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.423 |  |
| eu-west-3 | 0.456 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.832 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.585 |  |
| us-east-1 | 0.127 | 4997 |
| us-east-2 | 0.135 | 1679 |
| us-gov-east-1 | 0.121 | 1828 |
| us-gov-west-1 | 0.228 | 222 |
| us-west-1 | 0.173 | 3949 |
| us-west-2 | 0.227 | 177 |

