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
Updated: 2026-03-14T10:21:03.258166+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.523 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.836 |  |
| ap-southeast-4 | 0.721 |  |
| ap-southeast-5 | 0.799 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.201 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.539 |  |
| eu-south-2 | 0.541 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.491 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.847 |  |
| mx-central-1 | 0.264 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.164 | 4278 |
| us-east-2 | 0.151 | 1422 |
| us-gov-east-1 | 0.151 | 1574 |
| us-gov-west-1 | 0.188 | 183 |
| us-west-1 | 0.169 | 3226 |
| us-west-2 | 0.188 | 146 |

