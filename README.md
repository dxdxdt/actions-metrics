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
Updated: 2026-04-09T22:34:22.906904+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.972 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.666 |  |
| ap-northeast-1 | 0.550 |  |
| ap-northeast-2 | 0.652 |  |
| ap-northeast-3 | 0.577 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.884 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.820 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.904 |  |
| ca-central-1 | 0.196 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.495 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.395 |  |
| eu-west-2 | 0.427 |  |
| eu-west-3 | 0.462 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.863 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.581 |  |
| us-east-1 | 0.134 | 4468 |
| us-east-2 | 0.147 | 1489 |
| us-gov-east-1 | 0.150 | 1637 |
| us-gov-west-1 | 0.218 | 192 |
| us-west-1 | 0.166 | 3385 |
| us-west-2 | 0.216 | 154 |

