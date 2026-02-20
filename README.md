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
Updated: 2026-02-20T09:34:05.087825+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.662 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.927 |  |
| ap-south-2 | 0.986 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.731 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.760 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.162 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.459 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.507 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.495 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.434 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.794 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.117 | 4151 |
| us-east-2 | 0.119 | 1356 |
| us-gov-east-1 | 0.122 | 1493 |
| us-gov-west-1 | 0.233 | 159 |
| us-west-1 | 0.215 | 3085 |
| us-west-2 | 0.226 | 128 |

