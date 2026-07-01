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
Updated: 2026-07-01T08:45:36.189853+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.877 |  |
| ap-east-1 | 0.804 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.623 |  |
| ap-northeast-2 | 0.733 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.873 |  |
| ap-southeast-2 | 0.788 |  |
| ap-southeast-3 | 0.929 |  |
| ap-southeast-4 | 0.836 |  |
| ap-southeast-5 | 0.895 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.401 |  |
| eu-central-2 | 0.410 |  |
| eu-north-1 | 0.440 |  |
| eu-south-1 | 0.410 |  |
| eu-south-2 | 0.428 |  |
| eu-west-1 | 0.307 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.541 |  |
| me-central-1 | 0.781 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.494 |  |
| us-east-1 | 0.054 | 4807 |
| us-east-2 | 0.084 | 1649 |
| us-gov-east-1 | 0.084 | 1726 |
| us-gov-west-1 | 0.309 | 200 |
| us-west-1 | 0.251 | 3724 |
| us-west-2 | 0.306 | 163 |

