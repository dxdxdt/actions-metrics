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
Updated: 2026-03-03T12:38:53.067581+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.687 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.512 |  |
| ap-northeast-2 | 0.615 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.948 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.659 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.701 |  |
| ap-southeast-5 | 0.781 |  |
| ap-southeast-6 | 0.763 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.204 | 16 |
| ca-west-1 | 0.193 |  |
| eu-central-1 | 0.533 |  |
| eu-central-2 | 0.539 |  |
| eu-north-1 | 0.587 |  |
| eu-south-1 | 0.549 |  |
| eu-south-2 | 0.563 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.489 |  |
| eu-west-3 | 0.506 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.896 |  |
| me-south-1 | 0.860 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.199 | 4212 |
| us-east-2 | 0.148 | 1393 |
| us-gov-east-1 | 0.143 | 1527 |
| us-gov-west-1 | 0.168 | 169 |
| us-west-1 | 0.154 | 3164 |
| us-west-2 | 0.170 | 136 |

