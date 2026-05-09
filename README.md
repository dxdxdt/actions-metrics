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
Updated: 2026-05-09T22:35:38.774918+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.692 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.540 |  |
| ap-south-1 | 0.930 |  |
| ap-south-2 | 0.957 |  |
| ap-southeast-1 | 0.767 |  |
| ap-southeast-2 | 0.679 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.714 |  |
| ap-southeast-5 | 0.788 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.195 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.512 |  |
| eu-central-2 | 0.536 |  |
| eu-north-1 | 0.572 |  |
| eu-south-1 | 0.540 |  |
| eu-south-2 | 0.549 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.473 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.665 |  |
| me-central-1 | 0.893 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.169 | 4617 |
| us-east-2 | 0.121 | 1581 |
| us-gov-east-1 | 0.129 | 1683 |
| us-gov-west-1 | 0.190 | 195 |
| us-west-1 | 0.134 | 3547 |
| us-west-2 | 0.188 | 157 |

