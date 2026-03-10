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
Updated: 2026-03-10T09:37:02.839634+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.704 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.683 |  |
| ap-northeast-3 | 0.603 |  |
| ap-south-1 | 0.958 |  |
| ap-south-2 | 0.985 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.749 |  |
| ap-southeast-3 | 0.878 |  |
| ap-southeast-4 | 0.792 |  |
| ap-southeast-5 | 0.847 |  |
| ap-southeast-6 | 0.810 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.109 | 16 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.466 |  |
| eu-central-2 | 0.484 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.388 |  |
| eu-west-2 | 0.415 |  |
| eu-west-3 | 0.447 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.799 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.096 | 4252 |
| us-east-2 | 0.077 | 1415 |
| us-gov-east-1 | 0.075 | 1551 |
| us-gov-west-1 | 0.229 | 177 |
| us-west-1 | 0.244 | 3205 |
| us-west-2 | 0.229 | 144 |

