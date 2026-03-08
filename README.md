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
Updated: 2026-03-08T10:18:49.384662+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.951 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.681 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.801 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.879 |  |
| ca-central-1 | 0.195 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.511 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.675 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.840 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.600 |  |
| us-east-1 | 0.154 | 4240 |
| us-east-2 | 0.148 | 1408 |
| us-gov-east-1 | 0.150 | 1542 |
| us-gov-west-1 | 0.191 | 174 |
| us-west-1 | 0.170 | 3195 |
| us-west-2 | 0.189 | 144 |

