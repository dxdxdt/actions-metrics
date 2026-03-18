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
Updated: 2026-03-18T01:26:15.487836+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.713 |  |
| ap-east-2 | 0.654 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.638 |  |
| ap-northeast-3 | 0.564 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.791 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.843 |  |
| ap-southeast-4 | 0.743 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.497 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.531 |  |
| eu-west-1 | 0.419 |  |
| eu-west-2 | 0.443 |  |
| eu-west-3 | 0.470 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.834 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.136 | 4298 |
| us-east-2 | 0.118 | 1432 |
| us-gov-east-1 | 0.123 | 1584 |
| us-gov-west-1 | 0.196 | 188 |
| us-west-1 | 0.200 | 3249 |
| us-west-2 | 0.196 | 148 |

