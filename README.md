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
Updated: 2026-03-04T11:25:08.524153+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.048 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.598 |  |
| ap-northeast-1 | 0.479 |  |
| ap-northeast-2 | 0.588 |  |
| ap-northeast-3 | 0.504 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.731 |  |
| ap-southeast-2 | 0.621 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.662 |  |
| ap-southeast-5 | 0.751 |  |
| ap-southeast-6 | 0.659 |  |
| ap-southeast-7 | 0.836 |  |
| ca-central-1 | 0.262 | 16 |
| ca-west-1 | 0.178 |  |
| eu-central-1 | 0.564 |  |
| eu-central-2 | 0.573 |  |
| eu-north-1 | 0.612 |  |
| eu-south-1 | 0.601 |  |
| eu-south-2 | 0.602 |  |
| eu-west-1 | 0.488 |  |
| eu-west-2 | 0.519 |  |
| eu-west-3 | 0.541 |  |
| il-central-1 | 0.725 |  |
| me-central-1 | 0.965 |  |
| me-south-1 | 0.909 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.664 |  |
| us-east-1 | 0.231 | 4216 |
| us-east-2 | 0.190 | 1397 |
| us-gov-east-1 | 0.189 | 1529 |
| us-gov-west-1 | 0.135 | 169 |
| us-west-1 | 0.105 | 3170 |
| us-west-2 | 0.135 | 140 |

