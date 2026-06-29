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
Updated: 2026-06-29T10:26:42.673180+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.986 |  |
| ap-east-1 | 0.705 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.864 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.777 |  |
| ap-southeast-2 | 0.666 |  |
| ap-southeast-3 | 0.828 |  |
| ap-southeast-4 | 0.711 |  |
| ap-southeast-5 | 0.794 |  |
| ap-southeast-6 | 0.703 |  |
| ap-southeast-7 | 0.879 |  |
| ca-central-1 | 0.221 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.496 |  |
| eu-central-2 | 0.527 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.460 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.898 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.171 | 4802 |
| us-east-2 | 0.166 | 1646 |
| us-gov-east-1 | 0.173 | 1723 |
| us-gov-west-1 | 0.192 | 199 |
| us-west-1 | 0.136 | 3719 |
| us-west-2 | 0.189 | 163 |

