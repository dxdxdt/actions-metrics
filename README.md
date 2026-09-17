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
Updated: 2026-09-17T14:00:13.640008+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.087 |  |
| ap-east-1 | 0.619 |  |
| ap-east-2 | 0.560 |  |
| ap-northeast-1 | 0.442 |  |
| ap-northeast-2 | 0.554 |  |
| ap-northeast-3 | 0.469 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.861 |  |
| ap-southeast-1 | 0.716 |  |
| ap-southeast-2 | 0.575 |  |
| ap-southeast-3 | 0.752 |  |
| ap-southeast-4 | 0.618 |  |
| ap-southeast-5 | 0.716 |  |
| ap-southeast-6 | 0.632 |  |
| ap-southeast-7 | 0.800 |  |
| ca-central-1 | 0.302 | 18 |
| ca-west-1 | 0.166 |  |
| eu-central-1 | 0.599 |  |
| eu-central-2 | 0.630 |  |
| eu-north-1 | 0.656 |  |
| eu-south-1 | 0.619 |  |
| eu-south-2 | 0.637 |  |
| eu-west-1 | 0.528 |  |
| eu-west-2 | 0.562 |  |
| eu-west-3 | 0.581 |  |
| il-central-1 | 0.768 |  |
| me-central-1 | 0.994 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.717 |  |
| us-east-1 | 0.271 | 5103 |
| us-east-2 | 0.274 | 1686 |
| us-gov-east-1 | 0.245 | 1914 |
| us-gov-west-1 | 0.100 | 234 |
| us-west-1 | 0.048 | 4121 |
| us-west-2 | 0.099 | 192 |

