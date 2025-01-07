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
Updated: 2025-01-07T06:17:02.938027

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.051 |  |
| ap-east-1 | 0.734 |  |
| ap-northeast-1 | 0.533 |  |
| ap-northeast-2 | 0.645 |  |
| ap-south-1 | 0.906 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.676 |  |
| ca-central-1 | 0.266 | 2 |
| eu-central-1 | 0.571 |  |
| eu-north-1 | 0.603 |  |
| eu-south-1 | 0.580 |  |
| eu-west-1 | 0.477 |  |
| eu-west-2 | 0.514 |  |
| eu-west-3 | 0.532 |  |
| me-south-1 | 0.917 |  |
| sa-east-1 | 0.658 |  |
| us-east-1 | 0.211 | 604 |
| us-east-2 | 0.223 | 136 |
| us-gov-east-1 | 0.220 | 126 |
| us-gov-west-1 | 0.210 |  |
| us-west-1 | 0.142 | 380 |
| us-west-2 | 0.211 |  |

