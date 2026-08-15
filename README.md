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
Updated: 2026-08-15T05:18:11.548052+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.651 |  |
| ap-east-2 | 0.592 |  |
| ap-northeast-1 | 0.475 |  |
| ap-northeast-2 | 0.581 |  |
| ap-northeast-3 | 0.503 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.728 |  |
| ap-southeast-2 | 0.610 |  |
| ap-southeast-3 | 0.781 |  |
| ap-southeast-4 | 0.652 |  |
| ap-southeast-5 | 0.746 |  |
| ap-southeast-6 | 0.647 |  |
| ap-southeast-7 | 0.830 |  |
| ca-central-1 | 0.266 | 18 |
| ca-west-1 | 0.179 |  |
| eu-central-1 | 0.547 |  |
| eu-central-2 | 0.576 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.578 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.482 |  |
| eu-west-2 | 0.511 |  |
| eu-west-3 | 0.536 |  |
| il-central-1 | 0.718 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.677 |  |
| us-east-1 | 0.224 | 4998 |
| us-east-2 | 0.225 | 1679 |
| us-gov-east-1 | 0.196 | 1829 |
| us-gov-west-1 | 0.137 | 222 |
| us-west-1 | 0.081 | 3952 |
| us-west-2 | 0.139 | 177 |

