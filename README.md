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
Updated: 2026-04-12T11:28:58.183941+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.994 |  |
| ap-east-1 | 0.700 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.630 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.918 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.777 |  |
| ap-southeast-2 | 0.676 |  |
| ap-southeast-3 | 0.831 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.759 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.190 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.515 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.533 |  |
| eu-south-2 | 0.541 |  |
| eu-west-1 | 0.441 |  |
| eu-west-2 | 0.472 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.883 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.153 | 4486 |
| us-east-2 | 0.134 | 1496 |
| us-gov-east-1 | 0.146 | 1643 |
| us-gov-west-1 | 0.195 | 192 |
| us-west-1 | 0.142 | 3400 |
| us-west-2 | 0.195 | 155 |

