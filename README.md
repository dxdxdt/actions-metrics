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
Updated: 2026-03-02T12:39:14.071386+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.717 |  |
| ap-east-2 | 0.659 |  |
| ap-northeast-1 | 0.538 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.974 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.742 |  |
| ap-southeast-5 | 0.810 |  |
| ap-southeast-6 | 0.734 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.163 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.498 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.548 |  |
| eu-south-1 | 0.524 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.424 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.470 |  |
| il-central-1 | 0.660 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.833 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.605 |  |
| us-east-1 | 0.131 | 4208 |
| us-east-2 | 0.112 | 1390 |
| us-gov-east-1 | 0.108 | 1522 |
| us-gov-west-1 | 0.193 | 167 |
| us-west-1 | 0.198 | 3157 |
| us-west-2 | 0.195 | 136 |

