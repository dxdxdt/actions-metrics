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
Updated: 2026-02-10T06:07:51.017297+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.751 |  |
| ap-northeast-1 | 0.575 |  |
| ap-northeast-2 | 0.684 |  |
| ap-south-1 | 0.918 |  |
| ap-south-2 | 0.994 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.754 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.793 |  |
| ca-central-1 | 0.128 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.437 |  |
| eu-central-2 | 0.465 |  |
| eu-north-1 | 0.486 |  |
| eu-south-1 | 0.483 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.360 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.417 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.798 |  |
| sa-east-1 | 0.547 |  |
| us-east-1 | 0.086 | 4094 |
| us-east-2 | 0.086 | 1328 |
| us-gov-east-1 | 0.081 | 1449 |
| us-gov-west-1 | 0.239 | 142 |
| us-west-1 | 0.242 | 3031 |
| us-west-2 | 0.240 | 125 |

