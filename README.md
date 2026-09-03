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
Updated: 2026-09-03T19:32:45.361760+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.669 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.652 |  |
| ap-northeast-3 | 0.576 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.861 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.909 |  |
| ca-central-1 | 0.192 | 18 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.495 |  |
| eu-north-1 | 0.531 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.398 |  |
| eu-west-2 | 0.429 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.634 |  |
| me-central-1 | 0.854 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.581 |  |
| us-east-1 | 0.141 | 5081 |
| us-east-2 | 0.156 | 1685 |
| us-gov-east-1 | 0.159 | 1893 |
| us-gov-west-1 | 0.217 | 231 |
| us-west-1 | 0.176 | 4078 |
| us-west-2 | 0.217 | 191 |

