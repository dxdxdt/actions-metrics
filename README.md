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
Updated: 2026-06-12T17:33:28.527155+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.696 |  |
| ap-northeast-3 | 0.616 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.858 |  |
| ap-southeast-2 | 0.733 |  |
| ap-southeast-3 | 0.915 |  |
| ap-southeast-4 | 0.783 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.785 |  |
| ap-southeast-7 | 0.950 |  |
| ca-central-1 | 0.155 | 16 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.419 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.468 |  |
| eu-south-1 | 0.457 |  |
| eu-south-2 | 0.453 |  |
| eu-west-1 | 0.347 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.396 |  |
| il-central-1 | 0.586 |  |
| me-central-1 | 0.809 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.094 | 4747 |
| us-east-2 | 0.137 | 1632 |
| us-gov-east-1 | 0.126 | 1711 |
| us-gov-west-1 | 0.273 | 198 |
| us-west-1 | 0.218 | 3659 |
| us-west-2 | 0.272 | 162 |

