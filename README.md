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
Updated: 2026-08-21T14:26:32.390820+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.067 |  |
| ap-east-1 | 0.643 |  |
| ap-east-2 | 0.582 |  |
| ap-northeast-1 | 0.463 |  |
| ap-northeast-2 | 0.570 |  |
| ap-northeast-3 | 0.490 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.723 |  |
| ap-southeast-2 | 0.609 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.651 |  |
| ap-southeast-5 | 0.741 |  |
| ap-southeast-6 | 0.654 |  |
| ap-southeast-7 | 0.824 |  |
| ca-central-1 | 0.308 | 18 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.591 |  |
| eu-central-2 | 0.614 |  |
| eu-north-1 | 0.631 |  |
| eu-south-1 | 0.615 |  |
| eu-south-2 | 0.623 |  |
| eu-west-1 | 0.509 |  |
| eu-west-2 | 0.544 |  |
| eu-west-3 | 0.576 |  |
| il-central-1 | 0.752 |  |
| me-central-1 | 0.958 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.685 |  |
| us-east-1 | 0.249 | 5036 |
| us-east-2 | 0.264 | 1680 |
| us-gov-east-1 | 0.260 | 1865 |
| us-gov-west-1 | 0.140 | 225 |
| us-west-1 | 0.084 | 4013 |
| us-west-2 | 0.136 | 184 |

