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
Updated: 2026-08-12T18:51:49.514356+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.679 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.494 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.523 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.754 |  |
| ap-southeast-2 | 0.651 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.695 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.682 |  |
| ap-southeast-7 | 0.858 |  |
| ca-central-1 | 0.261 | 18 |
| ca-west-1 | 0.307 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.571 |  |
| eu-west-1 | 0.453 |  |
| eu-west-2 | 0.498 |  |
| eu-west-3 | 0.516 |  |
| il-central-1 | 0.683 |  |
| me-central-1 | 0.917 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.201 | 4980 |
| us-east-2 | 0.220 | 1679 |
| us-gov-east-1 | 0.238 | 1822 |
| us-gov-west-1 | 0.168 | 222 |
| us-west-1 | 0.122 | 3932 |
| us-west-2 | 0.169 | 176 |

