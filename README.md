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
Updated: 2026-03-06T05:40:34.741954+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.056 |  |
| ap-east-1 | 0.641 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.481 |  |
| ap-northeast-2 | 0.566 |  |
| ap-northeast-3 | 0.482 |  |
| ap-south-1 | 0.918 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.717 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.787 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.743 |  |
| ap-southeast-6 | 0.665 |  |
| ap-southeast-7 | 0.835 |  |
| ca-central-1 | 0.263 | 16 |
| ca-west-1 | 0.147 |  |
| eu-central-1 | 0.566 |  |
| eu-central-2 | 0.575 |  |
| eu-north-1 | 0.601 |  |
| eu-south-1 | 0.577 |  |
| eu-south-2 | 0.596 |  |
| eu-west-1 | 0.474 |  |
| eu-west-2 | 0.529 |  |
| eu-west-3 | 0.544 |  |
| il-central-1 | 0.730 |  |
| me-central-1 | 0.930 |  |
| me-south-1 | 0.902 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.688 |  |
| us-east-1 | 0.230 | 4226 |
| us-east-2 | 0.199 | 1402 |
| us-gov-east-1 | 0.217 | 1532 |
| us-gov-west-1 | 0.115 | 173 |
| us-west-1 | 0.128 | 3181 |
| us-west-2 | 0.115 | 141 |

