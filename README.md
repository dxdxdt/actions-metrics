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
Updated: 2025-10-25T05:12:16.362496+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.692 |  |
| ap-northeast-1 | 0.496 |  |
| ap-northeast-2 | 0.598 |  |
| ap-south-1 | 0.889 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.637 |  |
| ca-central-1 | 0.232 | 15 |
| eu-central-1 | 0.542 |  |
| eu-north-1 | 0.578 |  |
| eu-south-1 | 0.554 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.489 |  |
| eu-west-3 | 0.515 |  |
| me-south-1 | 0.858 |  |
| sa-east-1 | 0.664 |  |
| us-east-1 | 0.208 | 3356 |
| us-east-2 | 0.195 | 968 |
| us-gov-east-1 | 0.167 | 1111 |
| us-gov-west-1 | 0.145 | 61 |
| us-west-1 | 0.123 | 2287 |
| us-west-2 | 0.154 | 22 |

