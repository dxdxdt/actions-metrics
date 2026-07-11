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
Updated: 2026-07-11T18:49:06.980167+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.663 |  |
| ap-east-2 | 0.602 |  |
| ap-northeast-1 | 0.483 |  |
| ap-northeast-2 | 0.589 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.737 |  |
| ap-southeast-2 | 0.623 |  |
| ap-southeast-3 | 0.796 |  |
| ap-southeast-4 | 0.670 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.661 |  |
| ap-southeast-7 | 0.845 |  |
| ca-central-1 | 0.273 | 16 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.571 |  |
| eu-north-1 | 0.598 |  |
| eu-south-1 | 0.582 |  |
| eu-south-2 | 0.573 |  |
| eu-west-1 | 0.474 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.527 |  |
| il-central-1 | 0.706 |  |
| me-central-1 | 0.916 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.209 | 4850 |
| us-east-2 | 0.221 | 1656 |
| us-gov-east-1 | 0.200 | 1738 |
| us-gov-west-1 | 0.157 | 202 |
| us-west-1 | 0.097 | 3767 |
| us-west-2 | 0.155 | 165 |

