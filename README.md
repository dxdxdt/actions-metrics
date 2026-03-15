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
Updated: 2026-03-15T11:20:51.793441+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.989 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.518 |  |
| ap-northeast-2 | 0.632 |  |
| ap-northeast-3 | 0.545 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.703 |  |
| ap-southeast-5 | 0.794 |  |
| ap-southeast-6 | 0.699 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.214 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.526 |  |
| eu-north-1 | 0.558 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.542 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.465 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.850 |  |
| mx-central-1 | 0.259 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.171 | 4282 |
| us-east-2 | 0.171 | 1424 |
| us-gov-east-1 | 0.176 | 1577 |
| us-gov-west-1 | 0.190 | 185 |
| us-west-1 | 0.139 | 3235 |
| us-west-2 | 0.190 | 147 |

