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
Updated: 2026-08-22T05:19:58.535682+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.652 |  |
| ap-northeast-1 | 0.533 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.846 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.806 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.208 | 18 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.526 |  |
| eu-south-1 | 0.501 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.395 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.456 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.132 | 5042 |
| us-east-2 | 0.155 | 1681 |
| us-gov-east-1 | 0.152 | 1868 |
| us-gov-west-1 | 0.216 | 225 |
| us-west-1 | 0.155 | 4017 |
| us-west-2 | 0.215 | 184 |

