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
Updated: 2026-08-16T11:13:15.101115+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.705 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.691 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.777 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.127 | 18 |
| ca-west-1 | 0.287 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.444 |  |
| eu-north-1 | 0.463 |  |
| eu-south-1 | 0.446 |  |
| eu-south-2 | 0.461 |  |
| eu-west-1 | 0.340 |  |
| eu-west-2 | 0.372 |  |
| eu-west-3 | 0.407 |  |
| il-central-1 | 0.580 |  |
| me-central-1 | 0.796 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.545 |  |
| us-east-1 | 0.092 | 5008 |
| us-east-2 | 0.107 | 1679 |
| us-gov-east-1 | 0.107 | 1833 |
| us-gov-west-1 | 0.259 | 223 |
| us-west-1 | 0.206 | 3964 |
| us-west-2 | 0.256 | 179 |

