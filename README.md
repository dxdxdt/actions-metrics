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
Updated: 2026-07-26T11:57:04.382026+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.671 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.591 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.643 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.686 |  |
| ap-southeast-5 | 0.778 |  |
| ap-southeast-6 | 0.679 |  |
| ap-southeast-7 | 0.864 |  |
| ca-central-1 | 0.274 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.528 |  |
| eu-central-2 | 0.548 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.547 |  |
| eu-south-2 | 0.550 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.490 |  |
| eu-west-3 | 0.501 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.634 |  |
| us-east-1 | 0.194 | 4912 |
| us-east-2 | 0.214 | 1665 |
| us-gov-east-1 | 0.204 | 1778 |
| us-gov-west-1 | 0.183 | 207 |
| us-west-1 | 0.116 | 3837 |
| us-west-2 | 0.183 | 170 |

