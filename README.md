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
Updated: 2026-03-01T22:17:07.946259+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.051 |  |
| ap-east-1 | 0.635 |  |
| ap-east-2 | 0.570 |  |
| ap-northeast-1 | 0.449 |  |
| ap-northeast-2 | 0.551 |  |
| ap-northeast-3 | 0.472 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.708 |  |
| ap-southeast-2 | 0.600 |  |
| ap-southeast-3 | 0.764 |  |
| ap-southeast-4 | 0.640 |  |
| ap-southeast-5 | 0.728 |  |
| ap-southeast-6 | 0.639 |  |
| ap-southeast-7 | 0.807 |  |
| ca-central-1 | 0.311 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.565 |  |
| eu-central-2 | 0.588 |  |
| eu-north-1 | 0.639 |  |
| eu-south-1 | 0.613 |  |
| eu-south-2 | 0.602 |  |
| eu-west-1 | 0.504 |  |
| eu-west-2 | 0.536 |  |
| eu-west-3 | 0.554 |  |
| il-central-1 | 0.768 |  |
| me-central-1 | 0.943 |  |
| me-south-1 | 0.897 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.687 |  |
| us-east-1 | 0.238 | 4207 |
| us-east-2 | 0.218 | 1387 |
| us-gov-east-1 | 0.219 | 1519 |
| us-gov-west-1 | 0.131 | 167 |
| us-west-1 | 0.076 | 3153 |
| us-west-2 | 0.133 | 136 |

