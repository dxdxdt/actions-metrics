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
Updated: 2026-07-20T17:26:05.136763+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.883 |  |
| ap-east-1 | 0.798 |  |
| ap-east-2 | 0.738 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.645 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.872 |  |
| ap-southeast-2 | 0.751 |  |
| ap-southeast-3 | 0.927 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.894 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.975 |  |
| ca-central-1 | 0.142 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.433 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.331 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.397 |  |
| il-central-1 | 0.563 |  |
| me-central-1 | 0.818 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.507 |  |
| us-east-1 | 0.077 | 4890 |
| us-east-2 | 0.107 | 1657 |
| us-gov-east-1 | 0.115 | 1770 |
| us-gov-west-1 | 0.287 | 205 |
| us-west-1 | 0.233 | 3811 |
| us-west-2 | 0.287 | 167 |

