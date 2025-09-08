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
Updated: 2025-09-08T02:39:15.020500+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.054 |  |
| ap-east-1 | 0.679 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.591 |  |
| ap-south-1 | 0.983 |  |
| ap-southeast-1 | 0.740 |  |
| ap-southeast-2 | 0.621 |  |
| ca-central-1 | 0.272 | 13 |
| eu-central-1 | 0.578 |  |
| eu-north-1 | 0.628 |  |
| eu-south-1 | 0.597 |  |
| eu-west-1 | 0.497 |  |
| eu-west-2 | 0.531 |  |
| eu-west-3 | 0.543 |  |
| me-south-1 | 0.939 |  |
| sa-east-1 | 0.685 |  |
| us-east-1 | 0.227 | 3006 |
| us-east-2 | 0.267 | 802 |
| us-gov-east-1 | 0.196 | 919 |
| us-gov-west-1 | 0.144 | 8 |
| us-west-1 | 0.104 | 1996 |
| us-west-2 | 0.148 | 1 |

