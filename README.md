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
Updated: 2025-07-29T03:44:44.764415+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.005 |  |
| ap-east-1 | 0.732 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.645 |  |
| ap-south-1 | 0.871 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.675 |  |
| ca-central-1 | 0.223 | 11 |
| eu-central-1 | 0.528 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.550 |  |
| eu-west-1 | 0.443 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.491 |  |
| me-south-1 | 0.897 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.181 | 2578 |
| us-east-2 | 0.172 | 657 |
| us-gov-east-1 | 0.192 | 829 |
| us-gov-west-1 | 0.201 | 2 |
| us-west-1 | 0.139 | 1751 |
| us-west-2 | 0.207 |  |

