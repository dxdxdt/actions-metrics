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
Updated: 2026-05-12T14:00:50.572177+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.942 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.885 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.665 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 1.091 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.771 |  |
| ap-southeast-5 | 1.073 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.190 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.480 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.487 |  |
| eu-west-1 | 0.381 |  |
| eu-west-2 | 0.415 |  |
| eu-west-3 | 0.435 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.132 | 4630 |
| us-east-2 | 0.148 | 1589 |
| us-gov-east-1 | 0.151 | 1686 |
| us-gov-west-1 | 0.248 | 195 |
| us-west-1 | 0.190 | 3554 |
| us-west-2 | 0.266 | 158 |

