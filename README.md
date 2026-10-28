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
Updated: 2026-10-28T10:12:53.782875+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.719 |  |
| ap-east-1 | 0.556 |  |
| ap-east-2 | 0.506 |  |
| ap-northeast-1 | 0.417 |  |
| ap-northeast-2 | 0.495 |  |
| ap-northeast-3 | 0.436 |  |
| ap-south-1 | 0.682 |  |
| ap-south-2 | 0.749 |  |
| ap-southeast-1 | 0.609 |  |
| ap-southeast-2 | 0.536 |  |
| ap-southeast-3 | 0.652 |  |
| ap-southeast-4 | 0.595 |  |
| ap-southeast-5 | 0.623 |  |
| ap-southeast-6 | 0.581 |  |
| ap-southeast-7 | 0.690 |  |
| ca-central-1 | 0.119 | 18 |
| ca-west-1 | 0.160 |  |
| eu-central-1 | 0.357 |  |
| eu-central-2 | 0.372 |  |
| eu-north-1 | 0.390 |  |
| eu-south-1 | 0.377 |  |
| eu-south-2 | 0.363 |  |
| eu-west-1 | 0.295 |  |
| eu-west-2 | 0.320 |  |
| eu-west-3 | 0.346 |  |
| il-central-1 | 0.489 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.141 |  |
| sa-east-1 | 0.444 |  |
| us-east-1 | 0.099 | 5164 |
| us-east-2 | 0.085 | 1714 |
| us-gov-east-1 | 0.106 | 1955 |
| us-gov-west-1 | 0.174 | 240 |
| us-west-1 | 0.131 | 4197 |
| us-west-2 | 0.177 | 195 |

