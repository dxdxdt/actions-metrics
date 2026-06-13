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
Updated: 2026-06-13T06:52:58.208775+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.920 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.696 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.717 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.763 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.764 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.161 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.476 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.481 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.365 |  |
| eu-west-2 | 0.403 |  |
| eu-west-3 | 0.421 |  |
| il-central-1 | 0.602 |  |
| me-central-1 | 0.814 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.547 |  |
| us-east-1 | 0.118 | 4749 |
| us-east-2 | 0.125 | 1632 |
| us-gov-east-1 | 0.137 | 1712 |
| us-gov-west-1 | 0.251 | 198 |
| us-west-1 | 0.195 | 3660 |
| us-west-2 | 0.250 | 163 |

