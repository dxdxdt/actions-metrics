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
Updated: 2026-07-29T13:50:19.175841+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.893 |  |
| ap-east-1 | 0.789 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.611 |  |
| ap-northeast-2 | 0.716 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.910 |  |
| ap-southeast-4 | 0.812 |  |
| ap-southeast-5 | 0.878 |  |
| ap-southeast-6 | 0.815 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.142 | 17 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.410 |  |
| eu-central-2 | 0.434 |  |
| eu-north-1 | 0.472 |  |
| eu-south-1 | 0.430 |  |
| eu-south-2 | 0.444 |  |
| eu-west-1 | 0.334 |  |
| eu-west-2 | 0.367 |  |
| eu-west-3 | 0.389 |  |
| il-central-1 | 0.562 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.519 |  |
| us-east-1 | 0.079 | 4920 |
| us-east-2 | 0.115 | 1670 |
| us-gov-east-1 | 0.112 | 1782 |
| us-gov-west-1 | 0.286 | 207 |
| us-west-1 | 0.233 | 3853 |
| us-west-2 | 0.288 | 171 |

