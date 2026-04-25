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
Updated: 2026-04-25T10:37:39.075214+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.945 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.561 |  |
| ap-northeast-2 | 0.671 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.820 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.872 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.920 |  |
| ca-central-1 | 0.172 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.503 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.475 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.411 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.822 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.557 |  |
| us-east-1 | 0.115 | 4561 |
| us-east-2 | 0.138 | 1528 |
| us-gov-east-1 | 0.130 | 1663 |
| us-gov-west-1 | 0.250 | 194 |
| us-west-1 | 0.200 | 3476 |
| us-west-2 | 0.248 | 157 |

