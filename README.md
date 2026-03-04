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
Updated: 2026-03-04T21:27:56.470566+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.933 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.946 |  |
| ap-southeast-1 | 0.838 |  |
| ap-southeast-2 | 0.753 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.796 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.816 |  |
| ap-southeast-7 | 0.946 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.454 |  |
| eu-north-1 | 0.477 |  |
| eu-south-1 | 0.459 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.362 |  |
| eu-west-2 | 0.392 |  |
| eu-west-3 | 0.418 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.804 |  |
| me-south-1 | 0.776 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.548 |  |
| us-east-1 | 0.085 | 4220 |
| us-east-2 | 0.073 | 1398 |
| us-gov-east-1 | 0.071 | 1531 |
| us-gov-west-1 | 0.251 | 170 |
| us-west-1 | 0.243 | 3172 |
| us-west-2 | 0.283 | 140 |

