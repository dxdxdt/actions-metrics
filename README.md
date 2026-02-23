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
Updated: 2026-02-23T19:54:03.685251+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.700 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.682 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.717 |  |
| ap-southeast-5 | 0.795 |  |
| ap-southeast-6 | 0.711 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.193 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.529 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.563 |  |
| eu-west-1 | 0.430 |  |
| eu-west-2 | 0.468 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.707 |  |
| me-central-1 | 0.919 |  |
| me-south-1 | 0.887 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.622 |  |
| us-east-1 | 0.165 | 4172 |
| us-east-2 | 0.137 | 1372 |
| us-gov-east-1 | 0.162 | 1502 |
| us-gov-west-1 | 0.184 | 160 |
| us-west-1 | 0.169 | 3107 |
| us-west-2 | 0.182 | 130 |

