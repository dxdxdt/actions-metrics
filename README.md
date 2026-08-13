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
Updated: 2026-08-13T19:52:47.750046+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.721 |  |
| ap-east-2 | 0.656 |  |
| ap-northeast-1 | 0.543 |  |
| ap-northeast-2 | 0.646 |  |
| ap-northeast-3 | 0.571 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.803 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.864 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.764 |  |
| ap-southeast-7 | 0.910 |  |
| ca-central-1 | 0.215 | 18 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.476 |  |
| eu-central-2 | 0.502 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.499 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.414 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.449 |  |
| il-central-1 | 0.630 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.581 |  |
| us-east-1 | 0.141 | 4988 |
| us-east-2 | 0.177 | 1679 |
| us-gov-east-1 | 0.180 | 1825 |
| us-gov-west-1 | 0.233 | 222 |
| us-west-1 | 0.176 | 3940 |
| us-west-2 | 0.235 | 176 |

