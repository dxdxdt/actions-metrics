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
Updated: 2026-07-02T22:03:04.870131+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.048 |  |
| ap-east-1 | 0.648 |  |
| ap-east-2 | 0.586 |  |
| ap-northeast-1 | 0.469 |  |
| ap-northeast-2 | 0.575 |  |
| ap-northeast-3 | 0.495 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.720 |  |
| ap-southeast-2 | 0.597 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.639 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.633 |  |
| ap-southeast-7 | 0.821 |  |
| ca-central-1 | 0.292 | 16 |
| ca-west-1 | 0.180 |  |
| eu-central-1 | 0.575 |  |
| eu-central-2 | 0.608 |  |
| eu-north-1 | 0.618 |  |
| eu-south-1 | 0.621 |  |
| eu-south-2 | 0.614 |  |
| eu-west-1 | 0.501 |  |
| eu-west-2 | 0.537 |  |
| eu-west-3 | 0.560 |  |
| il-central-1 | 0.746 |  |
| me-central-1 | 0.984 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.682 |  |
| us-east-1 | 0.246 | 4812 |
| us-east-2 | 0.211 | 1650 |
| us-gov-east-1 | 0.222 | 1727 |
| us-gov-west-1 | 0.128 | 200 |
| us-west-1 | 0.069 | 3731 |
| us-west-2 | 0.128 | 164 |

