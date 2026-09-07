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
Updated: 2026-09-07T23:12:43.816748+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.915 |  |
| ap-east-1 | 0.778 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.697 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.910 |  |
| ap-southeast-4 | 0.794 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.143 | 18 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.445 |  |
| eu-north-1 | 0.501 |  |
| eu-south-1 | 0.460 |  |
| eu-south-2 | 0.483 |  |
| eu-west-1 | 0.355 |  |
| eu-west-2 | 0.390 |  |
| eu-west-3 | 0.411 |  |
| il-central-1 | 0.602 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.082 | 5091 |
| us-east-2 | 0.102 | 1685 |
| us-gov-east-1 | 0.107 | 1902 |
| us-gov-west-1 | 0.278 | 231 |
| us-west-1 | 0.215 | 4088 |
| us-west-2 | 0.279 | 192 |

