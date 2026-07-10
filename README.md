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
Updated: 2026-07-10T22:53:50.462621+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.912 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.618 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.748 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.796 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.778 |  |
| ap-southeast-7 | 0.948 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.459 |  |
| eu-north-1 | 0.474 |  |
| eu-south-1 | 0.461 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.395 |  |
| eu-west-3 | 0.410 |  |
| il-central-1 | 0.589 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.092 | 4846 |
| us-east-2 | 0.101 | 1656 |
| us-gov-east-1 | 0.085 | 1735 |
| us-gov-west-1 | 0.270 | 202 |
| us-west-1 | 0.216 | 3762 |
| us-west-2 | 0.270 | 164 |

