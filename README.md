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
Updated: 2026-06-13T22:56:55.658837+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.877 |  |
| ap-east-1 | 0.823 |  |
| ap-east-2 | 0.776 |  |
| ap-northeast-1 | 0.647 |  |
| ap-northeast-2 | 0.755 |  |
| ap-northeast-3 | 0.671 |  |
| ap-south-1 | 0.808 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.899 |  |
| ap-southeast-2 | 0.797 |  |
| ap-southeast-3 | 0.955 |  |
| ap-southeast-4 | 0.846 |  |
| ap-southeast-5 | 0.920 |  |
| ap-southeast-6 | 0.831 |  |
| ap-southeast-7 | 1.005 |  |
| ca-central-1 | 0.101 | 16 |
| ca-west-1 | 0.284 |  |
| eu-central-1 | 0.381 |  |
| eu-central-2 | 0.407 |  |
| eu-north-1 | 0.438 |  |
| eu-south-1 | 0.411 |  |
| eu-south-2 | 0.417 |  |
| eu-west-1 | 0.294 |  |
| eu-west-2 | 0.331 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.538 |  |
| me-central-1 | 0.739 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.479 |  |
| us-east-1 | 0.050 | 4755 |
| us-east-2 | 0.091 | 1633 |
| us-gov-east-1 | 0.088 | 1712 |
| us-gov-west-1 | 0.328 | 198 |
| us-west-1 | 0.269 | 3661 |
| us-west-2 | 0.323 | 163 |

