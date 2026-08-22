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
Updated: 2026-08-22T15:13:16.166290+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.035 |  |
| ap-east-1 | 0.654 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.477 |  |
| ap-northeast-2 | 0.585 |  |
| ap-northeast-3 | 0.502 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.731 |  |
| ap-southeast-2 | 0.610 |  |
| ap-southeast-3 | 0.788 |  |
| ap-southeast-4 | 0.652 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.647 |  |
| ap-southeast-7 | 0.834 |  |
| ca-central-1 | 0.288 | 18 |
| ca-west-1 | 0.193 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.590 |  |
| eu-north-1 | 0.601 |  |
| eu-south-1 | 0.591 |  |
| eu-south-2 | 0.588 |  |
| eu-west-1 | 0.480 |  |
| eu-west-2 | 0.522 |  |
| eu-west-3 | 0.536 |  |
| il-central-1 | 0.717 |  |
| me-central-1 | 0.951 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.673 |  |
| us-east-1 | 0.229 | 5046 |
| us-east-2 | 0.238 | 1681 |
| us-gov-east-1 | 0.222 | 1869 |
| us-gov-west-1 | 0.140 | 225 |
| us-west-1 | 0.084 | 4022 |
| us-west-2 | 0.138 | 184 |

