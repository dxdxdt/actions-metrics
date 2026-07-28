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
Updated: 2026-07-28T09:32:14.682719+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.934 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.668 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.568 |  |
| ap-south-1 | 0.940 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.873 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.913 |  |
| ca-central-1 | 0.201 | 17 |
| ca-west-1 | 0.274 |  |
| eu-central-1 | 0.462 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.519 |  |
| eu-south-1 | 0.495 |  |
| eu-south-2 | 0.490 |  |
| eu-west-1 | 0.394 |  |
| eu-west-2 | 0.427 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.883 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.568 |  |
| us-east-1 | 0.134 | 4915 |
| us-east-2 | 0.166 | 1670 |
| us-gov-east-1 | 0.158 | 1781 |
| us-gov-west-1 | 0.235 | 207 |
| us-west-1 | 0.170 | 3847 |
| us-west-2 | 0.234 | 170 |

