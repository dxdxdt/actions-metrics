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
Updated: 2026-10-18T19:08:20.727207+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.660 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.649 |  |
| ap-northeast-3 | 0.568 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 1.001 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.702 |  |
| ap-southeast-3 | 0.853 |  |
| ap-southeast-4 | 0.749 |  |
| ap-southeast-5 | 0.817 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.153 | 18 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.493 |  |
| eu-south-2 | 0.492 |  |
| eu-west-1 | 0.405 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.458 |  |
| il-central-1 | 0.627 |  |
| me-central-1 | 0.827 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.193 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.123 | 5151 |
| us-east-2 | 0.107 | 1703 |
| us-gov-east-1 | 0.113 | 1949 |
| us-gov-west-1 | 0.212 | 239 |
| us-west-1 | 0.162 | 4175 |
| us-west-2 | 0.215 | 195 |

