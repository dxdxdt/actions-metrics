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
Updated: 2026-04-01T08:12:06.861787+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.715 |  |
| ap-northeast-3 | 0.626 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.920 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.809 |  |
| ap-southeast-7 | 0.964 |  |
| ca-central-1 | 0.135 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.479 |  |
| eu-south-1 | 0.449 |  |
| eu-south-2 | 0.459 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.399 |  |
| il-central-1 | 0.591 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.571 |  |
| us-east-1 | 0.086 | 4413 |
| us-east-2 | 0.107 | 1470 |
| us-gov-east-1 | 0.106 | 1618 |
| us-gov-west-1 | 0.286 | 190 |
| us-west-1 | 0.235 | 3328 |
| us-west-2 | 0.286 | 153 |

