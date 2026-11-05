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
Updated: 2026-11-05T22:34:29.403684+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.707 |  |
| ap-east-1 | 0.550 |  |
| ap-east-2 | 0.510 |  |
| ap-northeast-1 | 0.412 |  |
| ap-northeast-2 | 0.491 |  |
| ap-northeast-3 | 0.431 |  |
| ap-south-1 | 0.641 |  |
| ap-south-2 | 0.678 |  |
| ap-southeast-1 | 0.617 |  |
| ap-southeast-2 | 0.532 |  |
| ap-southeast-3 | 0.651 |  |
| ap-southeast-4 | 0.591 |  |
| ap-southeast-5 | 0.624 |  |
| ap-southeast-6 | 0.570 |  |
| ap-southeast-7 | 0.686 |  |
| ca-central-1 | 0.129 | 18 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.341 |  |
| eu-central-2 | 0.354 |  |
| eu-north-1 | 0.385 |  |
| eu-south-1 | 0.361 |  |
| eu-south-2 | 0.353 |  |
| eu-west-1 | 0.283 |  |
| eu-west-2 | 0.309 |  |
| eu-west-3 | 0.322 |  |
| il-central-1 | 0.463 |  |
| me-central-1 | 0.620 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.159 |  |
| sa-east-1 | 0.411 |  |
| us-east-1 | 0.100 | 5173 |
| us-east-2 | 0.118 | 1721 |
| us-gov-east-1 | 0.117 | 1959 |
| us-gov-west-1 | 0.185 | 244 |
| us-west-1 | 0.138 | 4207 |
| us-west-2 | 0.184 | 195 |

