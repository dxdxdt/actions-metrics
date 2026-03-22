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
Updated: 2026-03-22T21:19:54.668143+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.934 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.604 |  |
| ap-south-1 | 0.868 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.745 |  |
| ap-southeast-3 | 0.886 |  |
| ap-southeast-4 | 0.790 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.785 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.152 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.461 |  |
| eu-north-1 | 0.494 |  |
| eu-south-1 | 0.468 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.630 |  |
| me-central-1 | 0.813 |  |
| me-south-1 | 0.776 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.546 |  |
| us-east-1 | 0.103 | 4334 |
| us-east-2 | 0.108 | 1447 |
| us-gov-east-1 | 0.119 | 1595 |
| us-gov-west-1 | 0.264 | 189 |
| us-west-1 | 0.215 | 3282 |
| us-west-2 | 0.266 | 151 |

