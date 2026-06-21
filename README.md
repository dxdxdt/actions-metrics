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
Updated: 2026-06-21T12:06:58.877591+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.965 |  |
| ap-east-1 | 0.732 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.554 |  |
| ap-northeast-2 | 0.660 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.861 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.908 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.488 |  |
| eu-central-2 | 0.503 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.437 |  |
| eu-west-3 | 0.466 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.590 |  |
| us-east-1 | 0.138 | 4780 |
| us-east-2 | 0.119 | 1636 |
| us-gov-east-1 | 0.123 | 1716 |
| us-gov-west-1 | 0.224 | 198 |
| us-west-1 | 0.169 | 3688 |
| us-west-2 | 0.224 | 163 |

