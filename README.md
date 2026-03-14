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
Updated: 2026-03-14T06:37:02.898427+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.657 |  |
| ap-east-2 | 0.597 |  |
| ap-northeast-1 | 0.476 |  |
| ap-northeast-2 | 0.585 |  |
| ap-northeast-3 | 0.502 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.629 |  |
| ap-southeast-3 | 0.791 |  |
| ap-southeast-4 | 0.669 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.845 |  |
| ca-central-1 | 0.262 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.548 |  |
| eu-north-1 | 0.595 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.493 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.516 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.924 |  |
| me-south-1 | 0.872 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.647 |  |
| us-east-1 | 0.204 | 4278 |
| us-east-2 | 0.204 | 1422 |
| us-gov-east-1 | 0.202 | 1573 |
| us-gov-west-1 | 0.155 | 183 |
| us-west-1 | 0.110 | 3223 |
| us-west-2 | 0.155 | 146 |

