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
Updated: 2026-06-21T09:38:51.102561+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.695 |  |
| ap-east-2 | 0.633 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.542 |  |
| ap-south-1 | 0.864 |  |
| ap-south-2 | 0.861 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.659 |  |
| ap-southeast-3 | 0.824 |  |
| ap-southeast-4 | 0.704 |  |
| ap-southeast-5 | 0.790 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.242 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.524 |  |
| eu-central-2 | 0.545 |  |
| eu-north-1 | 0.569 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.505 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.884 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.250 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.190 | 4780 |
| us-east-2 | 0.180 | 1636 |
| us-gov-east-1 | 0.190 | 1715 |
| us-gov-west-1 | 0.181 | 198 |
| us-west-1 | 0.127 | 3688 |
| us-west-2 | 0.181 | 163 |

