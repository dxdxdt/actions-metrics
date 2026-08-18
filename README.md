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
Updated: 2026-08-18T08:26:29.386921+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.020 |  |
| ap-east-1 | 0.656 |  |
| ap-east-2 | 0.596 |  |
| ap-northeast-1 | 0.477 |  |
| ap-northeast-2 | 0.588 |  |
| ap-northeast-3 | 0.504 |  |
| ap-south-1 | 0.878 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.713 |  |
| ap-southeast-2 | 0.658 |  |
| ap-southeast-3 | 0.788 |  |
| ap-southeast-4 | 0.705 |  |
| ap-southeast-5 | 0.753 |  |
| ap-southeast-6 | 0.684 |  |
| ap-southeast-7 | 0.833 |  |
| ca-central-1 | 0.239 | 18 |
| ca-west-1 | 0.181 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.558 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.566 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.458 |  |
| eu-west-2 | 0.503 |  |
| eu-west-3 | 0.519 |  |
| il-central-1 | 0.698 |  |
| me-central-1 | 0.933 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.649 |  |
| us-east-1 | 0.198 | 5015 |
| us-east-2 | 0.214 | 1680 |
| us-gov-east-1 | 0.201 | 1843 |
| us-gov-west-1 | 0.151 | 224 |
| us-west-1 | 0.145 | 3985 |
| us-west-2 | 0.149 | 182 |

