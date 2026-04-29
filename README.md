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
Updated: 2026-04-29T05:47:49.123167+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.054 |  |
| ap-east-1 | 0.646 |  |
| ap-east-2 | 0.581 |  |
| ap-northeast-1 | 0.464 |  |
| ap-northeast-2 | 0.566 |  |
| ap-northeast-3 | 0.489 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.736 |  |
| ap-southeast-2 | 0.597 |  |
| ap-southeast-3 | 0.789 |  |
| ap-southeast-4 | 0.639 |  |
| ap-southeast-5 | 0.732 |  |
| ap-southeast-6 | 0.668 |  |
| ap-southeast-7 | 0.821 |  |
| ca-central-1 | 0.295 | 16 |
| ca-west-1 | 0.186 |  |
| eu-central-1 | 0.598 |  |
| eu-central-2 | 0.613 |  |
| eu-north-1 | 0.641 |  |
| eu-south-1 | 0.615 |  |
| eu-south-2 | 0.605 |  |
| eu-west-1 | 0.508 |  |
| eu-west-2 | 0.545 |  |
| eu-west-3 | 0.557 |  |
| il-central-1 | 0.726 |  |
| me-central-1 | 0.943 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.693 |  |
| us-east-1 | 0.243 | 4575 |
| us-east-2 | 0.215 | 1543 |
| us-gov-east-1 | 0.221 | 1666 |
| us-gov-west-1 | 0.127 | 194 |
| us-west-1 | 0.070 | 3499 |
| us-west-2 | 0.125 | 157 |

