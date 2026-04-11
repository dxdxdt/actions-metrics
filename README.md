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
Updated: 2026-04-11T15:27:02.638760+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.898 |  |
| ap-east-1 | 0.803 |  |
| ap-east-2 | 0.728 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.718 |  |
| ap-northeast-3 | 0.627 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.781 |  |
| ap-southeast-3 | 0.918 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.880 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.340 |  |
| eu-central-1 | 0.398 |  |
| eu-central-2 | 0.421 |  |
| eu-north-1 | 0.458 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.436 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.365 |  |
| eu-west-3 | 0.381 |  |
| il-central-1 | 0.576 |  |
| me-central-1 | 0.778 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.506 |  |
| us-east-1 | 0.071 | 4478 |
| us-east-2 | 0.103 | 1494 |
| us-gov-east-1 | 0.104 | 1641 |
| us-gov-west-1 | 0.291 | 192 |
| us-west-1 | 0.239 | 3396 |
| us-west-2 | 0.291 | 155 |

