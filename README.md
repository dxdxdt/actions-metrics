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
Updated: 2026-03-03T05:43:45.039622+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.721 |  |
| ap-east-2 | 0.663 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.567 |  |
| ap-south-1 | 0.933 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.793 |  |
| ap-southeast-2 | 0.708 |  |
| ap-southeast-3 | 0.848 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.757 |  |
| ap-southeast-7 | 0.896 |  |
| ca-central-1 | 0.178 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.500 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.528 |  |
| eu-west-1 | 0.408 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.852 |  |
| me-south-1 | 0.819 |  |
| mx-central-1 | 0.187 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.135 | 4211 |
| us-east-2 | 0.098 | 1393 |
| us-gov-east-1 | 0.101 | 1524 |
| us-gov-west-1 | 0.193 | 169 |
| us-west-1 | 0.207 | 3161 |
| us-west-2 | 0.191 | 136 |

