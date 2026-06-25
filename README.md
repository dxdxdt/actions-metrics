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
Updated: 2026-06-25T00:01:24.864739+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.032 |  |
| ap-east-1 | 0.642 |  |
| ap-east-2 | 0.576 |  |
| ap-northeast-1 | 0.460 |  |
| ap-northeast-2 | 0.560 |  |
| ap-northeast-3 | 0.484 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.718 |  |
| ap-southeast-2 | 0.605 |  |
| ap-southeast-3 | 0.774 |  |
| ap-southeast-4 | 0.652 |  |
| ap-southeast-5 | 0.736 |  |
| ap-southeast-6 | 0.647 |  |
| ap-southeast-7 | 0.820 |  |
| ca-central-1 | 0.290 | 16 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.558 |  |
| eu-central-2 | 0.593 |  |
| eu-north-1 | 0.599 |  |
| eu-south-1 | 0.607 |  |
| eu-south-2 | 0.583 |  |
| eu-west-1 | 0.479 |  |
| eu-west-2 | 0.524 |  |
| eu-west-3 | 0.526 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.665 |  |
| us-east-1 | 0.223 | 4786 |
| us-east-2 | 0.228 | 1640 |
| us-gov-east-1 | 0.212 | 1720 |
| us-gov-west-1 | 0.143 | 199 |
| us-west-1 | 0.081 | 3701 |
| us-west-2 | 0.142 | 163 |

