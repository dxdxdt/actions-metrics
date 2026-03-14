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
Updated: 2026-03-14T22:19:09.928448+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.046 |  |
| ap-east-1 | 0.646 |  |
| ap-east-2 | 0.590 |  |
| ap-northeast-1 | 0.468 |  |
| ap-northeast-2 | 0.573 |  |
| ap-northeast-3 | 0.494 |  |
| ap-south-1 | 0.941 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.722 |  |
| ap-southeast-2 | 0.623 |  |
| ap-southeast-3 | 0.776 |  |
| ap-southeast-4 | 0.661 |  |
| ap-southeast-5 | 0.740 |  |
| ap-southeast-6 | 0.661 |  |
| ap-southeast-7 | 0.827 |  |
| ca-central-1 | 0.260 | 16 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.557 |  |
| eu-central-2 | 0.571 |  |
| eu-north-1 | 0.601 |  |
| eu-south-1 | 0.589 |  |
| eu-south-2 | 0.589 |  |
| eu-west-1 | 0.481 |  |
| eu-west-2 | 0.514 |  |
| eu-west-3 | 0.535 |  |
| il-central-1 | 0.740 |  |
| me-central-1 | 0.935 |  |
| me-south-1 | 0.905 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.665 |  |
| us-east-1 | 0.224 | 4279 |
| us-east-2 | 0.192 | 1422 |
| us-gov-east-1 | 0.191 | 1576 |
| us-gov-west-1 | 0.130 | 185 |
| us-west-1 | 0.111 | 3233 |
| us-west-2 | 0.132 | 146 |

