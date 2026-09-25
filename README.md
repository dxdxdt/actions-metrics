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
Updated: 2026-09-25T20:56:05.759613+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.676 |  |
| ap-east-2 | 0.606 |  |
| ap-northeast-1 | 0.494 |  |
| ap-northeast-2 | 0.589 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.942 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.651 |  |
| ap-southeast-3 | 0.820 |  |
| ap-southeast-4 | 0.694 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.703 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.233 | 18 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.534 |  |
| eu-north-1 | 0.553 |  |
| eu-south-1 | 0.543 |  |
| eu-south-2 | 0.547 |  |
| eu-west-1 | 0.433 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.497 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.902 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.200 |  |
| sa-east-1 | 0.632 |  |
| us-east-1 | 0.184 | 5121 |
| us-east-2 | 0.189 | 1686 |
| us-gov-east-1 | 0.180 | 1928 |
| us-gov-west-1 | 0.185 | 235 |
| us-west-1 | 0.121 | 4138 |
| us-west-2 | 0.181 | 192 |

