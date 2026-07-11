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
Updated: 2026-07-11T01:54:10.438454+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.615 |  |
| ap-northeast-1 | 0.494 |  |
| ap-northeast-2 | 0.596 |  |
| ap-northeast-3 | 0.519 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.703 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.694 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.244 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.543 |  |
| eu-north-1 | 0.556 |  |
| eu-south-1 | 0.552 |  |
| eu-south-2 | 0.541 |  |
| eu-west-1 | 0.437 |  |
| eu-west-2 | 0.487 |  |
| eu-west-3 | 0.490 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.907 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.193 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.185 | 4846 |
| us-east-2 | 0.199 | 1656 |
| us-gov-east-1 | 0.169 | 1735 |
| us-gov-west-1 | 0.185 | 202 |
| us-west-1 | 0.126 | 3764 |
| us-west-2 | 0.186 | 164 |

