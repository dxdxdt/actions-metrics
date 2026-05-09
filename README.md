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
Updated: 2026-05-09T02:08:06.374884+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.713 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.539 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.558 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.785 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.753 |  |
| ap-southeast-5 | 0.805 |  |
| ap-southeast-6 | 0.789 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.162 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.497 |  |
| eu-north-1 | 0.529 |  |
| eu-south-1 | 0.507 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.413 |  |
| eu-west-2 | 0.451 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.596 |  |
| us-east-1 | 0.137 | 4612 |
| us-east-2 | 0.119 | 1577 |
| us-gov-east-1 | 0.114 | 1682 |
| us-gov-west-1 | 0.204 | 195 |
| us-west-1 | 0.164 | 3542 |
| us-west-2 | 0.206 | 157 |

