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
Updated: 2026-03-14T20:19:56.735814+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.087 |  |
| ap-east-1 | 0.617 |  |
| ap-east-2 | 0.565 |  |
| ap-northeast-1 | 0.442 |  |
| ap-northeast-2 | 0.550 |  |
| ap-northeast-3 | 0.468 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.861 |  |
| ap-southeast-1 | 0.695 |  |
| ap-southeast-2 | 0.572 |  |
| ap-southeast-3 | 0.750 |  |
| ap-southeast-4 | 0.609 |  |
| ap-southeast-5 | 0.713 |  |
| ap-southeast-6 | 0.609 |  |
| ap-southeast-7 | 0.794 |  |
| ca-central-1 | 0.302 | 16 |
| ca-west-1 | 0.161 |  |
| eu-central-1 | 0.605 |  |
| eu-central-2 | 0.633 |  |
| eu-north-1 | 0.663 |  |
| eu-south-1 | 0.637 |  |
| eu-south-2 | 0.642 |  |
| eu-west-1 | 0.538 |  |
| eu-west-2 | 0.567 |  |
| eu-west-3 | 0.585 |  |
| il-central-1 | 0.790 |  |
| me-central-1 | 0.984 |  |
| me-south-1 | 0.940 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.716 |  |
| us-east-1 | 0.266 | 4279 |
| us-east-2 | 0.244 | 1422 |
| us-gov-east-1 | 0.244 | 1576 |
| us-gov-west-1 | 0.099 | 184 |
| us-west-1 | 0.048 | 3232 |
| us-west-2 | 0.100 | 146 |

