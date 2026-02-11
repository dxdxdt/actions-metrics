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
Updated: 2026-02-11T10:41:49.984220+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.891 |  |
| ap-east-1 | 0.792 |  |
| ap-northeast-1 | 0.616 |  |
| ap-northeast-2 | 0.731 |  |
| ap-south-1 | 0.838 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.873 |  |
| ap-southeast-2 | 0.776 |  |
| ap-southeast-3 | 0.939 |  |
| ap-southeast-4 | 0.815 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.281 |  |
| eu-central-1 | 0.391 |  |
| eu-central-2 | 0.404 |  |
| eu-north-1 | 0.443 |  |
| eu-south-1 | 0.421 |  |
| eu-south-2 | 0.428 |  |
| eu-west-1 | 0.319 |  |
| eu-west-2 | 0.352 |  |
| eu-west-3 | 0.369 |  |
| il-central-1 | 0.557 |  |
| me-central-1 | 0.788 |  |
| me-south-1 | 0.746 |  |
| sa-east-1 | 0.499 |  |
| us-east-1 | 0.066 | 4102 |
| us-east-2 | 0.108 | 1331 |
| us-gov-east-1 | 0.105 | 1451 |
| us-gov-west-1 | 0.318 | 143 |
| us-west-1 | 0.247 | 3039 |
| us-west-2 | 0.323 | 125 |

