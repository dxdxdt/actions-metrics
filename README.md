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
Updated: 2026-06-10T14:23:43.721845+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.685 |  |
| ap-east-2 | 0.614 |  |
| ap-northeast-1 | 0.504 |  |
| ap-northeast-2 | 0.614 |  |
| ap-northeast-3 | 0.527 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.686 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.855 |  |
| ca-central-1 | 0.247 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.527 |  |
| eu-central-2 | 0.559 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.568 |  |
| eu-south-2 | 0.560 |  |
| eu-west-1 | 0.448 |  |
| eu-west-2 | 0.494 |  |
| eu-west-3 | 0.505 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.956 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.207 | 4739 |
| us-east-2 | 0.181 | 1630 |
| us-gov-east-1 | 0.189 | 1710 |
| us-gov-west-1 | 0.170 | 198 |
| us-west-1 | 0.114 | 3655 |
| us-west-2 | 0.169 | 162 |

