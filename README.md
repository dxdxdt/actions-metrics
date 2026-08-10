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
Updated: 2026-08-10T15:52:58.291382+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.872 |  |
| ap-east-1 | 0.802 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.623 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.649 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.788 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.833 |  |
| ap-southeast-5 | 0.900 |  |
| ap-southeast-6 | 0.837 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.114 | 18 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.394 |  |
| eu-central-2 | 0.417 |  |
| eu-north-1 | 0.441 |  |
| eu-south-1 | 0.418 |  |
| eu-south-2 | 0.427 |  |
| eu-west-1 | 0.314 |  |
| eu-west-2 | 0.348 |  |
| eu-west-3 | 0.368 |  |
| il-central-1 | 0.551 |  |
| me-central-1 | 0.789 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.491 |  |
| us-east-1 | 0.059 | 4969 |
| us-east-2 | 0.081 | 1678 |
| us-gov-east-1 | 0.107 | 1816 |
| us-gov-west-1 | 0.308 | 216 |
| us-west-1 | 0.250 | 3916 |
| us-west-2 | 0.310 | 176 |

