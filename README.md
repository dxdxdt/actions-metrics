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
Updated: 2026-03-22T08:26:35.304723+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.531 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.557 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.784 |  |
| ap-southeast-2 | 0.683 |  |
| ap-southeast-3 | 0.841 |  |
| ap-southeast-4 | 0.723 |  |
| ap-southeast-5 | 0.803 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.205 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.496 |  |
| eu-central-2 | 0.506 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.527 |  |
| eu-south-2 | 0.533 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.443 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.662 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.833 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.170 | 4328 |
| us-east-2 | 0.166 | 1446 |
| us-gov-east-1 | 0.169 | 1594 |
| us-gov-west-1 | 0.208 | 189 |
| us-west-1 | 0.154 | 3277 |
| us-west-2 | 0.206 | 151 |

