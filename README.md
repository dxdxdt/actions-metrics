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
Updated: 2026-08-02T11:56:25.341297+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.678 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.504 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.527 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.643 |  |
| ap-southeast-3 | 0.811 |  |
| ap-southeast-4 | 0.685 |  |
| ap-southeast-5 | 0.773 |  |
| ap-southeast-6 | 0.686 |  |
| ap-southeast-7 | 0.860 |  |
| ca-central-1 | 0.257 | 17 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.522 |  |
| eu-central-2 | 0.537 |  |
| eu-north-1 | 0.560 |  |
| eu-south-1 | 0.549 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.446 |  |
| eu-west-2 | 0.482 |  |
| eu-west-3 | 0.506 |  |
| il-central-1 | 0.679 |  |
| me-central-1 | 0.897 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.195 | 4932 |
| us-east-2 | 0.203 | 1673 |
| us-gov-east-1 | 0.208 | 1796 |
| us-gov-west-1 | 0.164 | 209 |
| us-west-1 | 0.109 | 3870 |
| us-west-2 | 0.163 | 172 |

