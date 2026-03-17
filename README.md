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
Updated: 2026-03-17T23:25:38.704081+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.025 |  |
| ap-east-1 | 0.672 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.489 |  |
| ap-northeast-2 | 0.593 |  |
| ap-northeast-3 | 0.514 |  |
| ap-south-1 | 0.941 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.649 |  |
| ap-southeast-3 | 0.801 |  |
| ap-southeast-4 | 0.690 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.686 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.233 | 16 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.539 |  |
| eu-central-2 | 0.547 |  |
| eu-north-1 | 0.589 |  |
| eu-south-1 | 0.564 |  |
| eu-south-2 | 0.572 |  |
| eu-west-1 | 0.467 |  |
| eu-west-2 | 0.497 |  |
| eu-west-3 | 0.516 |  |
| il-central-1 | 0.727 |  |
| me-central-1 | 0.905 |  |
| me-south-1 | 0.873 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.636 |  |
| us-east-1 | 0.185 | 4298 |
| us-east-2 | 0.174 | 1431 |
| us-gov-east-1 | 0.184 | 1584 |
| us-gov-west-1 | 0.163 | 188 |
| us-west-1 | 0.133 | 3249 |
| us-west-2 | 0.165 | 148 |

