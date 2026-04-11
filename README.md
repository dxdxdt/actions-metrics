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
Updated: 2026-04-11T18:33:41.056926+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.869 |  |
| ap-east-1 | 0.822 |  |
| ap-east-2 | 0.764 |  |
| ap-northeast-1 | 0.639 |  |
| ap-northeast-2 | 0.739 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.829 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.889 |  |
| ap-southeast-2 | 0.834 |  |
| ap-southeast-3 | 0.960 |  |
| ap-southeast-4 | 0.860 |  |
| ap-southeast-5 | 0.913 |  |
| ap-southeast-6 | 0.884 |  |
| ap-southeast-7 | 0.996 |  |
| ca-central-1 | 0.099 | 16 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.377 |  |
| eu-central-2 | 0.398 |  |
| eu-north-1 | 0.436 |  |
| eu-south-1 | 0.402 |  |
| eu-south-2 | 0.413 |  |
| eu-west-1 | 0.289 |  |
| eu-west-2 | 0.333 |  |
| eu-west-3 | 0.356 |  |
| il-central-1 | 0.540 |  |
| me-central-1 | 0.747 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.474 |  |
| us-east-1 | 0.041 | 4481 |
| us-east-2 | 0.080 | 1494 |
| us-gov-east-1 | 0.090 | 1641 |
| us-gov-west-1 | 0.338 | 192 |
| us-west-1 | 0.290 | 3396 |
| us-west-2 | 0.354 | 155 |

