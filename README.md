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
Updated: 2026-03-31T14:26:55.838097+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.667 |  |
| ap-northeast-1 | 0.552 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.880 |  |
| ap-south-2 | 0.961 |  |
| ap-southeast-1 | 0.800 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.138 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.488 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.539 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.415 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.468 |  |
| il-central-1 | 0.661 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.833 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.120 | 4406 |
| us-east-2 | 0.102 | 1469 |
| us-gov-east-1 | 0.097 | 1618 |
| us-gov-west-1 | 0.225 | 190 |
| us-west-1 | 0.170 | 3325 |
| us-west-2 | 0.221 | 152 |

