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
Updated: 2026-08-20T05:23:13.952698+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.767 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.608 |  |
| ap-northeast-2 | 0.697 |  |
| ap-northeast-3 | 0.618 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.845 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.893 |  |
| ap-southeast-4 | 0.809 |  |
| ap-southeast-5 | 0.860 |  |
| ap-southeast-6 | 0.785 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.135 | 18 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.427 |  |
| eu-central-2 | 0.441 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.451 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.582 |  |
| me-central-1 | 0.808 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.296 |  |
| sa-east-1 | 0.536 |  |
| us-east-1 | 0.088 | 5026 |
| us-east-2 | 0.103 | 1680 |
| us-gov-east-1 | 0.104 | 1858 |
| us-gov-west-1 | 0.274 | 224 |
| us-west-1 | 0.224 | 3999 |
| us-west-2 | 0.271 | 184 |

