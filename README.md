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
Updated: 2026-06-27T13:16:06.514963+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.878 |  |
| ap-east-1 | 0.805 |  |
| ap-east-2 | 0.746 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.732 |  |
| ap-northeast-3 | 0.655 |  |
| ap-south-1 | 0.821 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.779 |  |
| ap-southeast-3 | 0.922 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.897 |  |
| ap-southeast-6 | 0.812 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.109 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.396 |  |
| eu-central-2 | 0.414 |  |
| eu-north-1 | 0.442 |  |
| eu-south-1 | 0.425 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.313 |  |
| eu-west-2 | 0.347 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.544 |  |
| me-central-1 | 0.781 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.496 |  |
| us-east-1 | 0.056 | 4792 |
| us-east-2 | 0.087 | 1643 |
| us-gov-east-1 | 0.086 | 1722 |
| us-gov-west-1 | 0.298 | 199 |
| us-west-1 | 0.257 | 3712 |
| us-west-2 | 0.299 | 163 |

