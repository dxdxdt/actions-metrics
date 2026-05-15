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
Updated: 2026-05-15T17:26:59.399322+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.922 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.585 |  |
| ap-northeast-2 | 0.700 |  |
| ap-northeast-3 | 0.637 |  |
| ap-south-1 | 0.846 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.845 |  |
| ap-southeast-2 | 0.739 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.773 |  |
| ap-southeast-7 | 0.949 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.441 |  |
| eu-central-2 | 0.464 |  |
| eu-north-1 | 0.488 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.419 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.814 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.548 |  |
| us-east-1 | 0.112 | 4641 |
| us-east-2 | 0.118 | 1594 |
| us-gov-east-1 | 0.143 | 1692 |
| us-gov-west-1 | 0.257 | 195 |
| us-west-1 | 0.204 | 3564 |
| us-west-2 | 0.252 | 158 |

