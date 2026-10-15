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
Updated: 2026-10-15T01:08:55.479385+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.709 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.523 |  |
| ap-northeast-2 | 0.630 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.872 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.659 |  |
| ap-southeast-3 | 0.836 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.799 |  |
| ap-southeast-6 | 0.744 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.202 | 18 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.499 |  |
| eu-central-2 | 0.523 |  |
| eu-north-1 | 0.558 |  |
| eu-south-1 | 0.529 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.424 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.483 |  |
| il-central-1 | 0.658 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.608 |  |
| us-east-1 | 0.170 | 5148 |
| us-east-2 | 0.155 | 1699 |
| us-gov-east-1 | 0.188 | 1940 |
| us-gov-west-1 | 0.191 | 237 |
| us-west-1 | 0.129 | 4170 |
| us-west-2 | 0.192 | 194 |

