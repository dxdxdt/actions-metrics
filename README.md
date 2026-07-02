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
Updated: 2026-07-02T20:57:18.907287+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.011 |  |
| ap-east-1 | 0.681 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.530 |  |
| ap-south-1 | 0.882 |  |
| ap-south-2 | 0.866 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.632 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.668 |  |
| ap-southeast-7 | 0.852 |  |
| ca-central-1 | 0.260 | 16 |
| ca-west-1 | 0.193 |  |
| eu-central-1 | 0.531 |  |
| eu-central-2 | 0.559 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.574 |  |
| eu-south-2 | 0.570 |  |
| eu-west-1 | 0.452 |  |
| eu-west-2 | 0.489 |  |
| eu-west-3 | 0.512 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.647 |  |
| us-east-1 | 0.217 | 4812 |
| us-east-2 | 0.190 | 1650 |
| us-gov-east-1 | 0.200 | 1727 |
| us-gov-west-1 | 0.165 | 200 |
| us-west-1 | 0.103 | 3730 |
| us-west-2 | 0.164 | 164 |

