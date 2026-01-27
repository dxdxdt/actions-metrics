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
Updated: 2026-01-27T07:22:00.724115+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.922 |  |
| ap-east-1 | 0.784 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.699 |  |
| ap-south-1 | 0.889 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.752 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.436 |  |
| eu-north-1 | 0.476 |  |
| eu-south-1 | 0.456 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.384 |  |
| eu-west-3 | 0.410 |  |
| me-south-1 | 0.779 |  |
| sa-east-1 | 0.537 |  |
| us-east-1 | 0.094 | 4004 |
| us-east-2 | 0.108 | 1291 |
| us-gov-east-1 | 0.106 | 1409 |
| us-gov-west-1 | 0.247 | 131 |
| us-west-1 | 0.225 | 2937 |
| us-west-2 | 0.257 | 112 |

