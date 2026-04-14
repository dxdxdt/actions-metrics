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
Updated: 2026-04-14T18:02:06.569734+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.967 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.672 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.663 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.720 |  |
| ap-southeast-3 | 0.870 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.833 |  |
| ap-southeast-6 | 0.790 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.153 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.485 |  |
| eu-central-2 | 0.495 |  |
| eu-north-1 | 0.537 |  |
| eu-south-1 | 0.503 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.461 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.852 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.584 |  |
| us-east-1 | 0.123 | 4502 |
| us-east-2 | 0.110 | 1500 |
| us-gov-east-1 | 0.115 | 1647 |
| us-gov-west-1 | 0.238 | 193 |
| us-west-1 | 0.189 | 3411 |
| us-west-2 | 0.230 | 155 |

