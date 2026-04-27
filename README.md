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
Updated: 2026-04-27T05:46:54.471704+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.928 |  |
| ap-east-1 | 0.765 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.671 |  |
| ap-northeast-2 | 0.684 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.785 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.805 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.851 |  |
| ap-southeast-7 | 0.950 |  |
| ca-central-1 | 0.142 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.442 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.456 |  |
| eu-south-2 | 0.466 |  |
| eu-west-1 | 0.350 |  |
| eu-west-2 | 0.388 |  |
| eu-west-3 | 0.406 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.816 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.092 | 4571 |
| us-east-2 | 0.118 | 1537 |
| us-gov-east-1 | 0.115 | 1665 |
| us-gov-west-1 | 0.291 | 194 |
| us-west-1 | 0.239 | 3488 |
| us-west-2 | 0.279 | 157 |

