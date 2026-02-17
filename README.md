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
Updated: 2026-02-17T11:34:44.635688+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.055 |  |
| ap-east-1 | 0.665 |  |
| ap-east-2 | 0.590 |  |
| ap-northeast-1 | 0.472 |  |
| ap-northeast-2 | 0.580 |  |
| ap-south-1 | 0.946 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.723 |  |
| ap-southeast-2 | 0.618 |  |
| ap-southeast-3 | 0.777 |  |
| ap-southeast-4 | 0.658 |  |
| ap-southeast-5 | 0.740 |  |
| ap-southeast-6 | 0.688 |  |
| ap-southeast-7 | 0.833 |  |
| ca-central-1 | 0.267 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.589 |  |
| eu-north-1 | 0.605 |  |
| eu-south-1 | 0.582 |  |
| eu-south-2 | 0.611 |  |
| eu-west-1 | 0.492 |  |
| eu-west-2 | 0.533 |  |
| eu-west-3 | 0.549 |  |
| il-central-1 | 0.757 |  |
| me-central-1 | 0.950 |  |
| me-south-1 | 0.895 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.678 |  |
| us-east-1 | 0.217 | 4134 |
| us-east-2 | 0.203 | 1350 |
| us-gov-east-1 | 0.191 | 1484 |
| us-gov-west-1 | 0.126 | 153 |
| us-west-1 | 0.107 | 3067 |
| us-west-2 | 0.132 | 126 |

