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
Updated: 2026-05-15T11:49:36.538630+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.673 |  |
| ap-northeast-3 | 0.599 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.829 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.794 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.479 |  |
| eu-north-1 | 0.500 |  |
| eu-south-1 | 0.495 |  |
| eu-south-2 | 0.501 |  |
| eu-west-1 | 0.397 |  |
| eu-west-2 | 0.425 |  |
| eu-west-3 | 0.449 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.843 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.107 | 4639 |
| us-east-2 | 0.081 | 1594 |
| us-gov-east-1 | 0.079 | 1692 |
| us-gov-west-1 | 0.246 | 195 |
| us-west-1 | 0.201 | 3563 |
| us-west-2 | 0.244 | 158 |

