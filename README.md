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
Updated: 2026-05-23T13:06:48.482740+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.730 |  |
| ap-northeast-1 | 0.612 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.642 |  |
| ap-south-1 | 0.834 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.924 |  |
| ap-southeast-4 | 0.808 |  |
| ap-southeast-5 | 0.876 |  |
| ap-southeast-6 | 0.811 |  |
| ap-southeast-7 | 0.972 |  |
| ca-central-1 | 0.137 | 16 |
| ca-west-1 | 0.284 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.431 |  |
| eu-north-1 | 0.453 |  |
| eu-south-1 | 0.440 |  |
| eu-south-2 | 0.448 |  |
| eu-west-1 | 0.333 |  |
| eu-west-2 | 0.368 |  |
| eu-west-3 | 0.393 |  |
| il-central-1 | 0.568 |  |
| me-central-1 | 0.780 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.523 |  |
| us-east-1 | 0.087 | 4679 |
| us-east-2 | 0.113 | 1607 |
| us-gov-east-1 | 0.118 | 1702 |
| us-gov-west-1 | 0.299 | 195 |
| us-west-1 | 0.235 | 3589 |
| us-west-2 | 0.296 | 159 |

