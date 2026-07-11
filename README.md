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
Updated: 2026-07-11T17:47:48.073478+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.967 |  |
| ap-east-1 | 0.715 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.533 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.850 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.726 |  |
| ap-southeast-7 | 0.892 |  |
| ca-central-1 | 0.207 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.480 |  |
| eu-central-2 | 0.503 |  |
| eu-north-1 | 0.521 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.511 |  |
| eu-west-1 | 0.406 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.456 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.143 | 4850 |
| us-east-2 | 0.165 | 1656 |
| us-gov-east-1 | 0.150 | 1738 |
| us-gov-west-1 | 0.224 | 202 |
| us-west-1 | 0.161 | 3766 |
| us-west-2 | 0.221 | 165 |

