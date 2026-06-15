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
Updated: 2026-06-15T20:48:09.250693+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.942 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.669 |  |
| ap-northeast-1 | 0.553 |  |
| ap-northeast-2 | 0.660 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.716 |  |
| ap-southeast-3 | 0.861 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.830 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.910 |  |
| ca-central-1 | 0.182 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.505 |  |
| eu-south-1 | 0.492 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.567 |  |
| us-east-1 | 0.129 | 4760 |
| us-east-2 | 0.148 | 1634 |
| us-gov-east-1 | 0.147 | 1713 |
| us-gov-west-1 | 0.239 | 198 |
| us-west-1 | 0.194 | 3669 |
| us-west-2 | 0.241 | 163 |

