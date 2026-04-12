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
Updated: 2026-04-12T09:39:39.618441+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.945 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.822 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.876 |  |
| ap-southeast-4 | 0.755 |  |
| ap-southeast-5 | 0.838 |  |
| ap-southeast-6 | 0.786 |  |
| ap-southeast-7 | 0.920 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.476 |  |
| eu-south-2 | 0.483 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.421 |  |
| il-central-1 | 0.620 |  |
| me-central-1 | 0.815 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.554 |  |
| us-east-1 | 0.118 | 4486 |
| us-east-2 | 0.127 | 1495 |
| us-gov-east-1 | 0.138 | 1643 |
| us-gov-west-1 | 0.246 | 192 |
| us-west-1 | 0.193 | 3399 |
| us-west-2 | 0.245 | 155 |

