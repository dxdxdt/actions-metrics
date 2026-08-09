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
Updated: 2026-08-09T20:22:29.802625+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.965 |  |
| ap-east-1 | 0.717 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.539 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.962 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.708 |  |
| ap-southeast-3 | 0.848 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.812 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.893 |  |
| ca-central-1 | 0.183 | 18 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.483 |  |
| eu-central-2 | 0.506 |  |
| eu-north-1 | 0.516 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.519 |  |
| eu-west-1 | 0.389 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.468 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.873 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.146 | 4964 |
| us-east-2 | 0.150 | 1678 |
| us-gov-east-1 | 0.131 | 1812 |
| us-gov-west-1 | 0.220 | 214 |
| us-west-1 | 0.169 | 3915 |
| us-west-2 | 0.221 | 175 |

