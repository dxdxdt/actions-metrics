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
Updated: 2026-08-20T22:18:43.611696+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.985 |  |
| ap-east-1 | 0.683 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.610 |  |
| ap-northeast-3 | 0.531 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.659 |  |
| ap-southeast-3 | 0.816 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.783 |  |
| ap-southeast-6 | 0.692 |  |
| ap-southeast-7 | 0.862 |  |
| ca-central-1 | 0.248 | 18 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.512 |  |
| eu-central-2 | 0.527 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.541 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.478 |  |
| eu-west-3 | 0.491 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.919 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.179 | 5032 |
| us-east-2 | 0.212 | 1680 |
| us-gov-east-1 | 0.211 | 1863 |
| us-gov-west-1 | 0.192 | 224 |
| us-west-1 | 0.131 | 4005 |
| us-west-2 | 0.195 | 184 |

