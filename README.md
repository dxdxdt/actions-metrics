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
Updated: 2026-06-22T23:14:12.043112+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.040 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.606 |  |
| ap-northeast-1 | 0.489 |  |
| ap-northeast-2 | 0.590 |  |
| ap-northeast-3 | 0.514 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.741 |  |
| ap-southeast-2 | 0.618 |  |
| ap-southeast-3 | 0.793 |  |
| ap-southeast-4 | 0.662 |  |
| ap-southeast-5 | 0.760 |  |
| ap-southeast-6 | 0.652 |  |
| ap-southeast-7 | 0.842 |  |
| ca-central-1 | 0.280 | 16 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.560 |  |
| eu-central-2 | 0.602 |  |
| eu-north-1 | 0.615 |  |
| eu-south-1 | 0.612 |  |
| eu-south-2 | 0.594 |  |
| eu-west-1 | 0.492 |  |
| eu-west-2 | 0.525 |  |
| eu-west-3 | 0.538 |  |
| il-central-1 | 0.732 |  |
| me-central-1 | 0.954 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.669 |  |
| us-east-1 | 0.226 | 4785 |
| us-east-2 | 0.214 | 1637 |
| us-gov-east-1 | 0.209 | 1717 |
| us-gov-west-1 | 0.146 | 198 |
| us-west-1 | 0.089 | 3692 |
| us-west-2 | 0.146 | 163 |

