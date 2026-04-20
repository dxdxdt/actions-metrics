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
Updated: 2026-04-20T07:13:25.187301+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.569 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.586 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.735 |  |
| ap-southeast-3 | 0.890 |  |
| ap-southeast-4 | 0.765 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.178 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.449 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.505 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.413 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.119 | 4530 |
| us-east-2 | 0.132 | 1517 |
| us-gov-east-1 | 0.134 | 1657 |
| us-gov-west-1 | 0.251 | 194 |
| us-west-1 | 0.199 | 3447 |
| us-west-2 | 0.253 | 156 |

