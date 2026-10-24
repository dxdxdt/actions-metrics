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
Updated: 2026-10-24T18:29:22.319105+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.993 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.618 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.526 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.956 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.708 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.224 | 18 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.536 |  |
| eu-north-1 | 0.558 |  |
| eu-south-1 | 0.539 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.475 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.669 |  |
| me-central-1 | 0.881 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.181 | 5159 |
| us-east-2 | 0.178 | 1707 |
| us-gov-east-1 | 0.188 | 1953 |
| us-gov-west-1 | 0.179 | 240 |
| us-west-1 | 0.119 | 4191 |
| us-west-2 | 0.179 | 195 |

