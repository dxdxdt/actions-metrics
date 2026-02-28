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
Updated: 2026-02-28T21:15:12.913012+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.861 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.099 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.432 |  |
| eu-central-2 | 0.451 |  |
| eu-north-1 | 0.477 |  |
| eu-south-1 | 0.455 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.388 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.595 |  |
| me-central-1 | 0.804 |  |
| me-south-1 | 0.758 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.080 | 4201 |
| us-east-2 | 0.068 | 1385 |
| us-gov-east-1 | 0.071 | 1519 |
| us-gov-west-1 | 0.242 | 166 |
| us-west-1 | 0.249 | 3142 |
| us-west-2 | 0.248 | 134 |

