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
Updated: 2026-04-19T17:29:55.913500+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.040 |  |
| ap-east-1 | 0.681 |  |
| ap-east-2 | 0.618 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.523 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.684 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.685 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.257 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.542 |  |
| eu-central-2 | 0.569 |  |
| eu-north-1 | 0.598 |  |
| eu-south-1 | 0.557 |  |
| eu-south-2 | 0.578 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.525 |  |
| il-central-1 | 0.714 |  |
| me-central-1 | 0.921 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.199 | 4526 |
| us-east-2 | 0.197 | 1515 |
| us-gov-east-1 | 0.196 | 1656 |
| us-gov-west-1 | 0.167 | 194 |
| us-west-1 | 0.108 | 3445 |
| us-west-2 | 0.165 | 156 |

