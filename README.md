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
Updated: 2026-07-13T08:53:33.002205+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.960 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.679 |  |
| ap-northeast-1 | 0.561 |  |
| ap-northeast-2 | 0.665 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.978 |  |
| ap-southeast-1 | 0.814 |  |
| ap-southeast-2 | 0.723 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.766 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.138 | 16 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.457 |  |
| eu-central-2 | 0.488 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.429 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.624 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.193 |  |
| sa-east-1 | 0.574 |  |
| us-east-1 | 0.115 | 4862 |
| us-east-2 | 0.116 | 1656 |
| us-gov-east-1 | 0.097 | 1743 |
| us-gov-west-1 | 0.235 | 202 |
| us-west-1 | 0.180 | 3773 |
| us-west-2 | 0.236 | 165 |

