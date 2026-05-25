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
Updated: 2026-05-25T07:06:15.768858+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.610 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.954 |  |
| ca-central-1 | 0.148 | 16 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.436 |  |
| eu-central-2 | 0.467 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.481 |  |
| eu-south-2 | 0.478 |  |
| eu-west-1 | 0.360 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.419 |  |
| il-central-1 | 0.596 |  |
| me-central-1 | 0.833 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.538 |  |
| us-east-1 | 0.105 | 4688 |
| us-east-2 | 0.118 | 1611 |
| us-gov-east-1 | 0.118 | 1705 |
| us-gov-west-1 | 0.262 | 195 |
| us-west-1 | 0.217 | 3597 |
| us-west-2 | 0.266 | 160 |

