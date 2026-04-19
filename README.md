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
Updated: 2026-04-19T06:26:24.496958+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.057 |  |
| ap-east-1 | 0.656 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.585 |  |
| ap-northeast-3 | 0.500 |  |
| ap-south-1 | 0.927 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.729 |  |
| ap-southeast-2 | 0.629 |  |
| ap-southeast-3 | 0.788 |  |
| ap-southeast-4 | 0.658 |  |
| ap-southeast-5 | 0.754 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.829 |  |
| ca-central-1 | 0.261 | 16 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.556 |  |
| eu-central-2 | 0.583 |  |
| eu-north-1 | 0.620 |  |
| eu-south-1 | 0.585 |  |
| eu-south-2 | 0.592 |  |
| eu-west-1 | 0.480 |  |
| eu-west-2 | 0.526 |  |
| eu-west-3 | 0.550 |  |
| il-central-1 | 0.729 |  |
| me-central-1 | 0.938 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.667 |  |
| us-east-1 | 0.217 | 4524 |
| us-east-2 | 0.189 | 1513 |
| us-gov-east-1 | 0.186 | 1656 |
| us-gov-west-1 | 0.140 | 194 |
| us-west-1 | 0.086 | 3439 |
| us-west-2 | 0.141 | 156 |

