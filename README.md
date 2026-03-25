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
Updated: 2026-03-25T23:27:46.150727+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.929 |  |
| ap-east-1 | 0.761 |  |
| ap-east-2 | 0.699 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.610 |  |
| ap-south-1 | 0.860 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.792 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.797 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.141 | 16 |
| ca-west-1 | 0.281 |  |
| eu-central-1 | 0.435 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.459 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.395 |  |
| eu-west-3 | 0.415 |  |
| il-central-1 | 0.610 |  |
| me-central-1 | 0.803 |  |
| me-south-1 | 0.777 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.545 |  |
| us-east-1 | 0.100 | 4359 |
| us-east-2 | 0.115 | 1455 |
| us-gov-east-1 | 0.112 | 1604 |
| us-gov-west-1 | 0.267 | 190 |
| us-west-1 | 0.220 | 3298 |
| us-west-2 | 0.270 | 151 |

