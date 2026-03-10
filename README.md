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
Updated: 2026-03-10T11:27:41.138490+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.959 |  |
| ap-east-1 | 0.755 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.577 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.601 |  |
| ap-south-1 | 0.951 |  |
| ap-south-2 | 0.986 |  |
| ap-southeast-1 | 0.827 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.878 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.842 |  |
| ap-southeast-7 | 0.921 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.478 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.489 |  |
| eu-south-2 | 0.495 |  |
| eu-west-1 | 0.393 |  |
| eu-west-2 | 0.423 |  |
| eu-west-3 | 0.446 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.833 |  |
| me-south-1 | 0.793 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.102 | 4252 |
| us-east-2 | 0.075 | 1415 |
| us-gov-east-1 | 0.072 | 1553 |
| us-gov-west-1 | 0.223 | 177 |
| us-west-1 | 0.241 | 3205 |
| us-west-2 | 0.218 | 144 |

