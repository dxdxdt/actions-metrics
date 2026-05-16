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
Updated: 2026-05-16T16:49:24.080786+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.891 |  |
| ap-east-1 | 0.793 |  |
| ap-east-2 | 0.730 |  |
| ap-northeast-1 | 0.613 |  |
| ap-northeast-2 | 0.714 |  |
| ap-northeast-3 | 0.639 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.948 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.923 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.884 |  |
| ap-southeast-6 | 0.875 |  |
| ap-southeast-7 | 0.979 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.299 |  |
| eu-central-1 | 0.402 |  |
| eu-central-2 | 0.419 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.425 |  |
| eu-south-2 | 0.438 |  |
| eu-west-1 | 0.322 |  |
| eu-west-2 | 0.358 |  |
| eu-west-3 | 0.380 |  |
| il-central-1 | 0.556 |  |
| me-central-1 | 0.783 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.504 |  |
| us-east-1 | 0.074 | 4648 |
| us-east-2 | 0.096 | 1596 |
| us-gov-east-1 | 0.097 | 1694 |
| us-gov-west-1 | 0.297 | 195 |
| us-west-1 | 0.239 | 3568 |
| us-west-2 | 0.297 | 158 |

