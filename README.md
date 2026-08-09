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
Updated: 2026-08-09T15:23:19.663259+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.731 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.554 |  |
| ap-northeast-2 | 0.656 |  |
| ap-northeast-3 | 0.579 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.719 |  |
| ap-southeast-3 | 0.863 |  |
| ap-southeast-4 | 0.761 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.771 |  |
| ap-southeast-7 | 0.908 |  |
| ca-central-1 | 0.180 | 18 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.463 |  |
| eu-central-2 | 0.480 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.868 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.582 |  |
| us-east-1 | 0.139 | 4962 |
| us-east-2 | 0.149 | 1677 |
| us-gov-east-1 | 0.135 | 1812 |
| us-gov-west-1 | 0.230 | 214 |
| us-west-1 | 0.178 | 3913 |
| us-west-2 | 0.230 | 175 |

