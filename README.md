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
Updated: 2026-07-21T01:54:24.150726+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.711 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.528 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.554 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.784 |  |
| ap-southeast-2 | 0.690 |  |
| ap-southeast-3 | 0.838 |  |
| ap-southeast-4 | 0.732 |  |
| ap-southeast-5 | 0.801 |  |
| ap-southeast-6 | 0.723 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.210 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.499 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.526 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.524 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.468 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.880 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.590 |  |
| us-east-1 | 0.146 | 4891 |
| us-east-2 | 0.171 | 1658 |
| us-gov-east-1 | 0.151 | 1771 |
| us-gov-west-1 | 0.216 | 205 |
| us-west-1 | 0.162 | 3813 |
| us-west-2 | 0.216 | 167 |

