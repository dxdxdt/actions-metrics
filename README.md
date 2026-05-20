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
Updated: 2026-05-20T10:21:02.732455+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.898 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.605 |  |
| ap-northeast-2 | 0.731 |  |
| ap-northeast-3 | 0.639 |  |
| ap-south-1 | 0.844 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.786 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.815 |  |
| ap-southeast-5 | 0.888 |  |
| ap-southeast-6 | 0.872 |  |
| ap-southeast-7 | 0.985 |  |
| ca-central-1 | 0.134 | 16 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.432 |  |
| eu-north-1 | 0.465 |  |
| eu-south-1 | 0.438 |  |
| eu-south-2 | 0.446 |  |
| eu-west-1 | 0.334 |  |
| eu-west-2 | 0.371 |  |
| eu-west-3 | 0.390 |  |
| il-central-1 | 0.571 |  |
| me-central-1 | 0.810 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.524 |  |
| us-east-1 | 0.082 | 4666 |
| us-east-2 | 0.116 | 1603 |
| us-gov-east-1 | 0.123 | 1699 |
| us-gov-west-1 | 0.296 | 195 |
| us-west-1 | 0.230 | 3581 |
| us-west-2 | 0.294 | 158 |

