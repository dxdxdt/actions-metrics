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
Updated: 2026-02-12T09:40:34.681233+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.765 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.706 |  |
| ap-south-1 | 0.931 |  |
| ap-south-2 | 0.980 |  |
| ap-southeast-1 | 0.854 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.896 |  |
| ap-southeast-4 | 0.802 |  |
| ca-central-1 | 0.130 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.446 |  |
| eu-north-1 | 0.474 |  |
| eu-south-1 | 0.457 |  |
| eu-south-2 | 0.466 |  |
| eu-west-1 | 0.346 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.410 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.898 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.091 | 4108 |
| us-east-2 | 0.102 | 1334 |
| us-gov-east-1 | 0.103 | 1453 |
| us-gov-west-1 | 0.263 | 145 |
| us-west-1 | 0.231 | 3044 |
| us-west-2 | 0.263 | 125 |

