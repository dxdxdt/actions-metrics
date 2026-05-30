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
Updated: 2026-05-30T16:07:20.180457+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.905 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.727 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.718 |  |
| ap-northeast-3 | 0.631 |  |
| ap-south-1 | 0.832 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.850 |  |
| ap-southeast-2 | 0.769 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.804 |  |
| ap-southeast-7 | 0.961 |  |
| ca-central-1 | 0.146 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.442 |  |
| eu-north-1 | 0.456 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.458 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.400 |  |
| il-central-1 | 0.571 |  |
| me-central-1 | 0.966 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.092 | 4701 |
| us-east-2 | 0.117 | 1614 |
| us-gov-east-1 | 0.120 | 1708 |
| us-gov-west-1 | 0.291 | 195 |
| us-west-1 | 0.236 | 3621 |
| us-west-2 | 0.292 | 161 |

