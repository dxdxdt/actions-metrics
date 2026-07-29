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
Updated: 2026-07-29T20:15:14.985236+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.926 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.690 |  |
| ap-northeast-3 | 0.615 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.747 |  |
| ap-southeast-3 | 0.893 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.861 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.950 |  |
| ca-central-1 | 0.121 | 17 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.466 |  |
| eu-north-1 | 0.480 |  |
| eu-south-1 | 0.459 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.408 |  |
| eu-west-3 | 0.432 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.548 |  |
| us-east-1 | 0.087 | 4920 |
| us-east-2 | 0.065 | 1670 |
| us-gov-east-1 | 0.063 | 1786 |
| us-gov-west-1 | 0.264 | 207 |
| us-west-1 | 0.204 | 3853 |
| us-west-2 | 0.259 | 171 |

