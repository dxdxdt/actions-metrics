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
Updated: 2026-02-15T20:18:06.694190+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.918 |  |
| ap-east-1 | 0.791 |  |
| ap-east-2 | 0.717 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.706 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.863 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.926 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.892 |  |
| ap-southeast-6 | 0.812 |  |
| ap-southeast-7 | 0.974 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.426 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.471 |  |
| eu-south-1 | 0.454 |  |
| eu-south-2 | 0.467 |  |
| eu-west-1 | 0.343 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.403 |  |
| il-central-1 | 0.589 |  |
| me-central-1 | 0.805 |  |
| me-south-1 | 0.758 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.525 |  |
| us-east-1 | 0.072 | 4126 |
| us-east-2 | 0.088 | 1346 |
| us-gov-east-1 | 0.091 | 1475 |
| us-gov-west-1 | 0.270 | 148 |
| us-west-1 | 0.258 | 3062 |
| us-west-2 | 0.273 | 125 |

