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
Updated: 2026-01-30T06:37:56.137296+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.969 |  |
| ap-east-1 | 0.760 |  |
| ap-northeast-1 | 0.567 |  |
| ap-northeast-2 | 0.673 |  |
| ap-south-1 | 0.879 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.707 |  |
| ca-central-1 | 0.189 | 16 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.474 |  |
| eu-north-1 | 0.539 |  |
| eu-south-1 | 0.502 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.454 |  |
| me-south-1 | 0.828 |  |
| sa-east-1 | 0.572 |  |
| us-east-1 | 0.140 | 4028 |
| us-east-2 | 0.154 | 1298 |
| us-gov-east-1 | 0.157 | 1417 |
| us-gov-west-1 | 0.229 | 132 |
| us-west-1 | 0.171 | 2954 |
| us-west-2 | 0.227 | 118 |

