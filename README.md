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
Updated: 2026-02-26T20:28:44.078588+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.779 |  |
| ap-east-2 | 0.706 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.745 |  |
| ap-southeast-3 | 0.910 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.858 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.945 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.436 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.485 |  |
| eu-south-1 | 0.462 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.364 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.815 |  |
| me-south-1 | 0.774 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.537 |  |
| us-east-1 | 0.091 | 4190 |
| us-east-2 | 0.100 | 1381 |
| us-gov-east-1 | 0.096 | 1513 |
| us-gov-west-1 | 0.250 | 162 |
| us-west-1 | 0.235 | 3125 |
| us-west-2 | 0.252 | 132 |

