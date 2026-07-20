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
Updated: 2026-07-20T06:08:30.576912+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.042 |  |
| ap-east-1 | 0.647 |  |
| ap-east-2 | 0.588 |  |
| ap-northeast-1 | 0.468 |  |
| ap-northeast-2 | 0.579 |  |
| ap-northeast-3 | 0.496 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.727 |  |
| ap-southeast-2 | 0.607 |  |
| ap-southeast-3 | 0.783 |  |
| ap-southeast-4 | 0.654 |  |
| ap-southeast-5 | 0.746 |  |
| ap-southeast-6 | 0.660 |  |
| ap-southeast-7 | 0.825 |  |
| ca-central-1 | 0.294 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.562 |  |
| eu-central-2 | 0.584 |  |
| eu-north-1 | 0.599 |  |
| eu-south-1 | 0.585 |  |
| eu-south-2 | 0.599 |  |
| eu-west-1 | 0.476 |  |
| eu-west-2 | 0.524 |  |
| eu-west-3 | 0.532 |  |
| il-central-1 | 0.701 |  |
| me-central-1 | 0.984 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.667 |  |
| us-east-1 | 0.219 | 4887 |
| us-east-2 | 0.237 | 1657 |
| us-gov-east-1 | 0.216 | 1770 |
| us-gov-west-1 | 0.142 | 205 |
| us-west-1 | 0.082 | 3810 |
| us-west-2 | 0.141 | 167 |

