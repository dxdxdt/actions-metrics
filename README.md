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
Updated: 2026-08-19T12:28:45.321297+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.046 |  |
| ap-east-1 | 0.639 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.459 |  |
| ap-northeast-2 | 0.568 |  |
| ap-northeast-3 | 0.483 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.717 |  |
| ap-southeast-2 | 0.598 |  |
| ap-southeast-3 | 0.770 |  |
| ap-southeast-4 | 0.643 |  |
| ap-southeast-5 | 0.737 |  |
| ap-southeast-6 | 0.637 |  |
| ap-southeast-7 | 0.821 |  |
| ca-central-1 | 0.290 | 18 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.560 |  |
| eu-central-2 | 0.587 |  |
| eu-north-1 | 0.610 |  |
| eu-south-1 | 0.597 |  |
| eu-south-2 | 0.607 |  |
| eu-west-1 | 0.487 |  |
| eu-west-2 | 0.535 |  |
| eu-west-3 | 0.540 |  |
| il-central-1 | 0.733 |  |
| me-central-1 | 0.967 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.665 |  |
| us-east-1 | 0.233 | 5021 |
| us-east-2 | 0.252 | 1680 |
| us-gov-east-1 | 0.244 | 1853 |
| us-gov-west-1 | 0.150 | 224 |
| us-west-1 | 0.074 | 3996 |
| us-west-2 | 0.149 | 182 |

