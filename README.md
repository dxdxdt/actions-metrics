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
Updated: 2025-09-08T21:11:27.323536+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.882 |  |
| ap-east-1 | 0.828 |  |
| ap-northeast-1 | 0.633 |  |
| ap-northeast-2 | 0.734 |  |
| ap-south-1 | 1.062 |  |
| ap-southeast-1 | 0.895 |  |
| ap-southeast-2 | 0.780 |  |
| ca-central-1 | 0.128 | 13 |
| eu-central-1 | 0.404 |  |
| eu-north-1 | 0.455 |  |
| eu-south-1 | 0.429 |  |
| eu-west-1 | 0.325 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.377 |  |
| me-south-1 | 0.758 |  |
| sa-east-1 | 0.493 |  |
| us-east-1 | 0.068 | 3015 |
| us-east-2 | 0.110 | 802 |
| us-gov-east-1 | 0.108 | 920 |
| us-gov-west-1 | 0.306 | 9 |
| us-west-1 | 0.254 | 2003 |
| us-west-2 | 0.308 | 2 |

