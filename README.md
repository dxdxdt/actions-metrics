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
Updated: 2025-02-22T04:13:26.195468+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.892 |  |
| ap-east-1 | 0.795 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.709 |  |
| ap-south-1 | 0.854 |  |
| ap-southeast-1 | 0.869 |  |
| ap-southeast-2 | 0.761 |  |
| ca-central-1 | 0.110 | 4 |
| eu-central-1 | 0.428 |  |
| eu-north-1 | 0.477 |  |
| eu-south-1 | 0.444 |  |
| eu-west-1 | 0.336 |  |
| eu-west-2 | 0.380 |  |
| eu-west-3 | 0.393 |  |
| me-south-1 | 0.773 |  |
| sa-east-1 | 0.519 |  |
| us-east-1 | 0.076 | 1068 |
| us-east-2 | 0.098 | 261 |
| us-gov-east-1 | 0.094 | 262 |
| us-gov-west-1 | 0.279 | 1 |
| us-west-1 | 0.237 | 707 |
| us-west-2 | 0.287 |  |

