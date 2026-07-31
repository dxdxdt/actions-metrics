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
Updated: 2026-07-31T15:56:38.799401+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.015 |  |
| ap-east-1 | 0.672 |  |
| ap-east-2 | 0.612 |  |
| ap-northeast-1 | 0.494 |  |
| ap-northeast-2 | 0.598 |  |
| ap-northeast-3 | 0.519 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.745 |  |
| ap-southeast-2 | 0.631 |  |
| ap-southeast-3 | 0.802 |  |
| ap-southeast-4 | 0.681 |  |
| ap-southeast-5 | 0.765 |  |
| ap-southeast-6 | 0.681 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.253 | 17 |
| ca-west-1 | 0.195 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.554 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.569 |  |
| eu-west-1 | 0.468 |  |
| eu-west-2 | 0.500 |  |
| eu-west-3 | 0.513 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.940 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.649 |  |
| us-east-1 | 0.203 | 4924 |
| us-east-2 | 0.207 | 1672 |
| us-gov-east-1 | 0.181 | 1791 |
| us-gov-west-1 | 0.162 | 208 |
| us-west-1 | 0.104 | 3860 |
| us-west-2 | 0.163 | 172 |

