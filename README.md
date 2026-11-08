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
Updated: 2026-11-08T16:53:58.339406+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.738 |  |
| ap-east-1 | 0.518 |  |
| ap-east-2 | 0.471 |  |
| ap-northeast-1 | 0.383 |  |
| ap-northeast-2 | 0.459 |  |
| ap-northeast-3 | 0.402 |  |
| ap-south-1 | 0.680 |  |
| ap-south-2 | 0.709 |  |
| ap-southeast-1 | 0.582 |  |
| ap-southeast-2 | 0.497 |  |
| ap-southeast-3 | 0.617 |  |
| ap-southeast-4 | 0.567 |  |
| ap-southeast-5 | 0.591 |  |
| ap-southeast-6 | 0.528 |  |
| ap-southeast-7 | 0.653 |  |
| ca-central-1 | 0.156 | 18 |
| ca-west-1 | 0.186 |  |
| eu-central-1 | 0.382 |  |
| eu-central-2 | 0.400 |  |
| eu-north-1 | 0.414 |  |
| eu-south-1 | 0.390 |  |
| eu-south-2 | 0.382 |  |
| eu-west-1 | 0.320 |  |
| eu-west-2 | 0.348 |  |
| eu-west-3 | 0.363 |  |
| il-central-1 | 0.500 |  |
| me-central-1 | 0.645 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.161 |  |
| sa-east-1 | 0.465 |  |
| us-east-1 | 0.127 | 5178 |
| us-east-2 | 0.136 | 1722 |
| us-gov-east-1 | 0.135 | 1959 |
| us-gov-west-1 | 0.151 | 245 |
| us-west-1 | 0.104 | 4211 |
| us-west-2 | 0.151 | 196 |

