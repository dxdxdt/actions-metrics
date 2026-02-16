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
Updated: 2026-02-16T17:33:14.391400+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.730 |  |
| ap-northeast-1 | 0.612 |  |
| ap-northeast-2 | 0.723 |  |
| ap-south-1 | 0.870 |  |
| ap-south-2 | 0.946 |  |
| ap-southeast-1 | 0.869 |  |
| ap-southeast-2 | 0.776 |  |
| ap-southeast-3 | 0.923 |  |
| ap-southeast-4 | 0.817 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.860 |  |
| ap-southeast-7 | 0.981 |  |
| ca-central-1 | 0.101 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.465 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.460 |  |
| eu-west-1 | 0.343 |  |
| eu-west-2 | 0.376 |  |
| eu-west-3 | 0.405 |  |
| il-central-1 | 0.589 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.762 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.522 |  |
| us-east-1 | 0.071 | 4131 |
| us-east-2 | 0.076 | 1348 |
| us-gov-east-1 | 0.073 | 1480 |
| us-gov-west-1 | 0.269 | 149 |
| us-west-1 | 0.268 | 3065 |
| us-west-2 | 0.274 | 126 |

