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
Updated: 2026-03-24T10:43:44.429371+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.869 |  |
| ap-east-1 | 0.821 |  |
| ap-east-2 | 0.758 |  |
| ap-northeast-1 | 0.638 |  |
| ap-northeast-2 | 0.758 |  |
| ap-northeast-3 | 0.661 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.886 |  |
| ap-southeast-2 | 0.810 |  |
| ap-southeast-3 | 0.946 |  |
| ap-southeast-4 | 0.843 |  |
| ap-southeast-5 | 0.910 |  |
| ap-southeast-6 | 0.850 |  |
| ap-southeast-7 | 0.986 |  |
| ca-central-1 | 0.101 | 16 |
| ca-west-1 | 0.292 |  |
| eu-central-1 | 0.374 |  |
| eu-central-2 | 0.389 |  |
| eu-north-1 | 0.432 |  |
| eu-south-1 | 0.402 |  |
| eu-south-2 | 0.412 |  |
| eu-west-1 | 0.296 |  |
| eu-west-2 | 0.327 |  |
| eu-west-3 | 0.356 |  |
| il-central-1 | 0.559 |  |
| me-central-1 | 0.747 |  |
| me-south-1 | 0.704 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.474 |  |
| us-east-1 | 0.043 | 4348 |
| us-east-2 | 0.086 | 1449 |
| us-gov-east-1 | 0.086 | 1600 |
| us-gov-west-1 | 0.310 | 190 |
| us-west-1 | 0.278 | 3289 |
| us-west-2 | 0.319 | 151 |

