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
Updated: 2026-07-20T23:51:01.970570+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.721 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.851 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.906 |  |
| ap-southeast-4 | 0.813 |  |
| ap-southeast-5 | 0.876 |  |
| ap-southeast-6 | 0.799 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.429 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.427 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.372 |  |
| eu-west-3 | 0.397 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.518 |  |
| us-east-1 | 0.074 | 4891 |
| us-east-2 | 0.087 | 1658 |
| us-gov-east-1 | 0.091 | 1771 |
| us-gov-west-1 | 0.284 | 205 |
| us-west-1 | 0.240 | 3812 |
| us-west-2 | 0.281 | 167 |

