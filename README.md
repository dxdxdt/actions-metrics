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
Updated: 2026-07-31T21:59:13.237589+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.868 |  |
| ap-east-1 | 0.802 |  |
| ap-east-2 | 0.746 |  |
| ap-northeast-1 | 0.615 |  |
| ap-northeast-2 | 0.738 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.834 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.933 |  |
| ap-southeast-4 | 0.826 |  |
| ap-southeast-5 | 0.908 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.112 | 17 |
| ca-west-1 | 0.287 |  |
| eu-central-1 | 0.393 |  |
| eu-central-2 | 0.412 |  |
| eu-north-1 | 0.433 |  |
| eu-south-1 | 0.419 |  |
| eu-south-2 | 0.436 |  |
| eu-west-1 | 0.313 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.550 |  |
| me-central-1 | 0.780 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.499 |  |
| us-east-1 | 0.062 | 4927 |
| us-east-2 | 0.086 | 1673 |
| us-gov-east-1 | 0.103 | 1791 |
| us-gov-west-1 | 0.306 | 208 |
| us-west-1 | 0.258 | 3860 |
| us-west-2 | 0.306 | 172 |

