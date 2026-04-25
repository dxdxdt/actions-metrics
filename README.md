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
Updated: 2026-04-25T04:31:18.033644+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.015 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.526 |  |
| ap-south-1 | 0.932 |  |
| ap-south-2 | 0.977 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.655 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.692 |  |
| ap-southeast-5 | 0.767 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.254 | 16 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.530 |  |
| eu-central-2 | 0.549 |  |
| eu-north-1 | 0.579 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.554 |  |
| eu-west-1 | 0.436 |  |
| eu-west-2 | 0.494 |  |
| eu-west-3 | 0.504 |  |
| il-central-1 | 0.685 |  |
| me-central-1 | 0.917 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.197 |  |
| sa-east-1 | 0.642 |  |
| us-east-1 | 0.188 | 4559 |
| us-east-2 | 0.173 | 1528 |
| us-gov-east-1 | 0.159 | 1663 |
| us-gov-west-1 | 0.167 | 194 |
| us-west-1 | 0.111 | 3474 |
| us-west-2 | 0.165 | 157 |

