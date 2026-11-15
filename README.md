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
Updated: 2026-11-15T15:08:22.065451+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.714 |  |
| ap-east-1 | 0.556 |  |
| ap-east-2 | 0.505 |  |
| ap-northeast-1 | 0.415 |  |
| ap-northeast-2 | 0.490 |  |
| ap-northeast-3 | 0.436 |  |
| ap-south-1 | 0.714 |  |
| ap-south-2 | 0.756 |  |
| ap-southeast-1 | 0.609 |  |
| ap-southeast-2 | 0.526 |  |
| ap-southeast-3 | 0.650 |  |
| ap-southeast-4 | 0.591 |  |
| ap-southeast-5 | 0.626 |  |
| ap-southeast-6 | 0.546 |  |
| ap-southeast-7 | 0.684 |  |
| ca-central-1 | 0.135 | 18 |
| ca-west-1 | 0.161 |  |
| eu-central-1 | 0.365 |  |
| eu-central-2 | 0.378 |  |
| eu-north-1 | 0.400 |  |
| eu-south-1 | 0.378 |  |
| eu-south-2 | 0.370 |  |
| eu-west-1 | 0.295 |  |
| eu-west-2 | 0.326 |  |
| eu-west-3 | 0.333 |  |
| il-central-1 | 0.463 |  |
| me-central-1 | 0.621 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.651 |  |
| mx-central-1 | 0.140 |  |
| sa-east-1 | 0.456 |  |
| us-east-1 | 0.103 | 5185 |
| us-east-2 | 0.087 | 1728 |
| us-gov-east-1 | 0.099 | 1962 |
| us-gov-west-1 | 0.169 | 247 |
| us-west-1 | 0.128 | 4217 |
| us-west-2 | 0.171 | 197 |

