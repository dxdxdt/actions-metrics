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
Updated: 2026-02-27T17:28:54.516413+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.042 |  |
| ap-east-1 | 0.652 |  |
| ap-east-2 | 0.583 |  |
| ap-northeast-1 | 0.466 |  |
| ap-northeast-2 | 0.573 |  |
| ap-northeast-3 | 0.492 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.726 |  |
| ap-southeast-2 | 0.627 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.667 |  |
| ap-southeast-5 | 0.749 |  |
| ap-southeast-6 | 0.678 |  |
| ap-southeast-7 | 0.833 |  |
| ca-central-1 | 0.279 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.552 |  |
| eu-central-2 | 0.568 |  |
| eu-north-1 | 0.609 |  |
| eu-south-1 | 0.574 |  |
| eu-south-2 | 0.585 |  |
| eu-west-1 | 0.480 |  |
| eu-west-2 | 0.526 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.754 |  |
| me-central-1 | 0.929 |  |
| me-south-1 | 0.893 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.212 | 4194 |
| us-east-2 | 0.199 | 1382 |
| us-gov-east-1 | 0.194 | 1515 |
| us-gov-west-1 | 0.153 | 162 |
| us-west-1 | 0.102 | 3135 |
| us-west-2 | 0.153 | 133 |

