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
Updated: 2026-10-25T19:25:53.000742+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.669 |  |
| ap-east-2 | 0.606 |  |
| ap-northeast-1 | 0.490 |  |
| ap-northeast-2 | 0.592 |  |
| ap-northeast-3 | 0.515 |  |
| ap-south-1 | 0.957 |  |
| ap-south-2 | 0.985 |  |
| ap-southeast-1 | 0.745 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.802 |  |
| ap-southeast-4 | 0.726 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.705 |  |
| ap-southeast-7 | 0.846 |  |
| ca-central-1 | 0.214 | 18 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.548 |  |
| eu-north-1 | 0.556 |  |
| eu-south-1 | 0.548 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.445 |  |
| eu-west-2 | 0.469 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.645 |  |
| us-east-1 | 0.185 | 5159 |
| us-east-2 | 0.178 | 1710 |
| us-gov-east-1 | 0.170 | 1954 |
| us-gov-west-1 | 0.168 | 240 |
| us-west-1 | 0.108 | 4194 |
| us-west-2 | 0.168 | 195 |

