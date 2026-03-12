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
Updated: 2026-03-12T10:32:17.914583+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.867 |  |
| ap-east-1 | 0.825 |  |
| ap-east-2 | 0.760 |  |
| ap-northeast-1 | 0.635 |  |
| ap-northeast-2 | 0.758 |  |
| ap-northeast-3 | 0.663 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.898 |  |
| ap-southeast-2 | 0.800 |  |
| ap-southeast-3 | 0.948 |  |
| ap-southeast-4 | 0.837 |  |
| ap-southeast-5 | 0.922 |  |
| ap-southeast-6 | 0.859 |  |
| ap-southeast-7 | 0.999 |  |
| ca-central-1 | 0.110 | 16 |
| ca-west-1 | 0.280 |  |
| eu-central-1 | 0.376 |  |
| eu-central-2 | 0.396 |  |
| eu-north-1 | 0.436 |  |
| eu-south-1 | 0.409 |  |
| eu-south-2 | 0.411 |  |
| eu-west-1 | 0.301 |  |
| eu-west-2 | 0.337 |  |
| eu-west-3 | 0.358 |  |
| il-central-1 | 0.550 |  |
| me-central-1 | 0.755 |  |
| me-south-1 | 0.713 |  |
| mx-central-1 | 0.292 |  |
| sa-east-1 | 0.480 |  |
| us-east-1 | 0.052 | 4265 |
| us-east-2 | 0.094 | 1419 |
| us-gov-east-1 | 0.095 | 1565 |
| us-gov-west-1 | 0.320 | 180 |
| us-west-1 | 0.261 | 3214 |
| us-west-2 | 0.331 | 144 |

