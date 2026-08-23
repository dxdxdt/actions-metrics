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
Updated: 2026-08-23T07:27:01.178235+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.075 |  |
| ap-east-1 | 0.618 |  |
| ap-east-2 | 0.560 |  |
| ap-northeast-1 | 0.441 |  |
| ap-northeast-2 | 0.546 |  |
| ap-northeast-3 | 0.468 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.868 |  |
| ap-southeast-1 | 0.693 |  |
| ap-southeast-2 | 0.570 |  |
| ap-southeast-3 | 0.749 |  |
| ap-southeast-4 | 0.611 |  |
| ap-southeast-5 | 0.712 |  |
| ap-southeast-6 | 0.607 |  |
| ap-southeast-7 | 0.799 |  |
| ca-central-1 | 0.331 | 18 |
| ca-west-1 | 0.168 |  |
| eu-central-1 | 0.599 |  |
| eu-central-2 | 0.620 |  |
| eu-north-1 | 0.651 |  |
| eu-south-1 | 0.633 |  |
| eu-south-2 | 0.629 |  |
| eu-west-1 | 0.524 |  |
| eu-west-2 | 0.558 |  |
| eu-west-3 | 0.580 |  |
| il-central-1 | 0.764 |  |
| me-central-1 | 0.997 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.713 |  |
| us-east-1 | 0.271 | 5048 |
| us-east-2 | 0.277 | 1681 |
| us-gov-east-1 | 0.249 | 1870 |
| us-gov-west-1 | 0.096 | 225 |
| us-west-1 | 0.041 | 4034 |
| us-west-2 | 0.099 | 184 |

