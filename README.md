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
Updated: 2026-02-13T15:35:14.735626+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.734 |  |
| ap-northeast-1 | 0.561 |  |
| ap-northeast-2 | 0.663 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.725 |  |
| ap-southeast-3 | 0.868 |  |
| ap-southeast-4 | 0.772 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.468 |  |
| eu-central-2 | 0.487 |  |
| eu-north-1 | 0.511 |  |
| eu-south-1 | 0.488 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.390 |  |
| eu-west-2 | 0.425 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.809 |  |
| sa-east-1 | 0.563 |  |
| us-east-1 | 0.113 | 4116 |
| us-east-2 | 0.092 | 1337 |
| us-gov-east-1 | 0.092 | 1457 |
| us-gov-west-1 | 0.218 | 146 |
| us-west-1 | 0.227 | 3054 |
| us-west-2 | 0.214 | 125 |

