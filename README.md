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
Updated: 2026-08-02T08:09:01.924136+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.664 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.490 |  |
| ap-northeast-2 | 0.595 |  |
| ap-northeast-3 | 0.514 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.740 |  |
| ap-southeast-2 | 0.630 |  |
| ap-southeast-3 | 0.795 |  |
| ap-southeast-4 | 0.672 |  |
| ap-southeast-5 | 0.759 |  |
| ap-southeast-6 | 0.676 |  |
| ap-southeast-7 | 0.846 |  |
| ca-central-1 | 0.243 | 17 |
| ca-west-1 | 0.189 |  |
| eu-central-1 | 0.536 |  |
| eu-central-2 | 0.557 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.565 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.495 |  |
| eu-west-3 | 0.524 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.920 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.660 |  |
| us-east-1 | 0.197 | 4931 |
| us-east-2 | 0.196 | 1673 |
| us-gov-east-1 | 0.189 | 1796 |
| us-gov-west-1 | 0.154 | 209 |
| us-west-1 | 0.097 | 3869 |
| us-west-2 | 0.152 | 172 |

