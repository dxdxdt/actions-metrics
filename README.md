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
Updated: 2026-07-16T13:25:08.551725+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.661 |  |
| ap-east-2 | 0.601 |  |
| ap-northeast-1 | 0.481 |  |
| ap-northeast-2 | 0.588 |  |
| ap-northeast-3 | 0.506 |  |
| ap-south-1 | 0.936 |  |
| ap-south-2 | 0.939 |  |
| ap-southeast-1 | 0.736 |  |
| ap-southeast-2 | 0.639 |  |
| ap-southeast-3 | 0.793 |  |
| ap-southeast-4 | 0.687 |  |
| ap-southeast-5 | 0.754 |  |
| ap-southeast-6 | 0.682 |  |
| ap-southeast-7 | 0.841 |  |
| ca-central-1 | 0.266 | 16 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.541 |  |
| eu-central-2 | 0.558 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.581 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.457 |  |
| eu-west-2 | 0.502 |  |
| eu-west-3 | 0.516 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.942 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.657 |  |
| us-east-1 | 0.207 | 4873 |
| us-east-2 | 0.224 | 1656 |
| us-gov-east-1 | 0.188 | 1756 |
| us-gov-west-1 | 0.161 | 202 |
| us-west-1 | 0.106 | 3788 |
| us-west-2 | 0.161 | 166 |

