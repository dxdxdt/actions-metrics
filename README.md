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
Updated: 2026-04-10T01:49:34.479111+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.912 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.602 |  |
| ap-northeast-2 | 0.701 |  |
| ap-northeast-3 | 0.628 |  |
| ap-south-1 | 0.851 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.854 |  |
| ap-southeast-2 | 0.773 |  |
| ap-southeast-3 | 0.902 |  |
| ap-southeast-4 | 0.825 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.881 |  |
| ap-southeast-7 | 0.959 |  |
| ca-central-1 | 0.119 | 16 |
| ca-west-1 | 0.298 |  |
| eu-central-1 | 0.417 |  |
| eu-central-2 | 0.432 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.458 |  |
| eu-west-1 | 0.334 |  |
| eu-west-2 | 0.371 |  |
| eu-west-3 | 0.397 |  |
| il-central-1 | 0.594 |  |
| me-central-1 | 0.797 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.518 |  |
| us-east-1 | 0.076 | 4469 |
| us-east-2 | 0.097 | 1489 |
| us-gov-east-1 | 0.095 | 1638 |
| us-gov-west-1 | 0.286 | 192 |
| us-west-1 | 0.237 | 3385 |
| us-west-2 | 0.275 | 154 |

