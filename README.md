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
Updated: 2026-02-17T20:29:26.595159+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.921 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.719 |  |
| ap-northeast-1 | 0.605 |  |
| ap-northeast-2 | 0.702 |  |
| ap-northeast-3 | 0.622 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.863 |  |
| ap-southeast-2 | 0.780 |  |
| ap-southeast-3 | 0.909 |  |
| ap-southeast-4 | 0.812 |  |
| ap-southeast-5 | 0.886 |  |
| ap-southeast-6 | 0.843 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.098 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.428 |  |
| eu-central-2 | 0.440 |  |
| eu-north-1 | 0.470 |  |
| eu-south-1 | 0.451 |  |
| eu-south-2 | 0.464 |  |
| eu-west-1 | 0.344 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.407 |  |
| il-central-1 | 0.601 |  |
| me-central-1 | 0.799 |  |
| me-south-1 | 0.759 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.525 |  |
| us-east-1 | 0.075 | 4136 |
| us-east-2 | 0.073 | 1353 |
| us-gov-east-1 | 0.071 | 1486 |
| us-gov-west-1 | 0.257 | 153 |
| us-west-1 | 0.256 | 3068 |
| us-west-2 | 0.270 | 126 |

