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
Updated: 2026-03-21T07:29:08.870368+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.733 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.659 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.965 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.866 |  |
| ap-southeast-4 | 0.766 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.752 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.160 | 16 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.523 |  |
| eu-south-1 | 0.499 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.801 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.570 |  |
| us-east-1 | 0.122 | 4319 |
| us-east-2 | 0.115 | 1444 |
| us-gov-east-1 | 0.129 | 1591 |
| us-gov-west-1 | 0.217 | 189 |
| us-west-1 | 0.194 | 3271 |
| us-west-2 | 0.216 | 149 |

