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
Updated: 2026-04-21T10:14:01.869429+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.924 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.688 |  |
| ap-northeast-3 | 0.615 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.963 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.773 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.814 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.832 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.442 |  |
| eu-central-2 | 0.450 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.458 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.393 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.805 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.091 | 4535 |
| us-east-2 | 0.086 | 1522 |
| us-gov-east-1 | 0.094 | 1658 |
| us-gov-west-1 | 0.264 | 194 |
| us-west-1 | 0.225 | 3453 |
| us-west-2 | 0.277 | 156 |

