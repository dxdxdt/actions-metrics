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
Updated: 2026-06-09T16:27:24.658854+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.745 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.671 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.838 |  |
| ap-southeast-6 | 0.752 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.136 | 16 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.496 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.627 |  |
| me-central-1 | 0.908 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.571 |  |
| us-east-1 | 0.118 | 4735 |
| us-east-2 | 0.085 | 1630 |
| us-gov-east-1 | 0.085 | 1710 |
| us-gov-west-1 | 0.238 | 198 |
| us-west-1 | 0.182 | 3652 |
| us-west-2 | 0.239 | 162 |

