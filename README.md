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
Updated: 2026-03-27T07:56:13.499299+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.914 |  |
| ap-east-1 | 0.772 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.622 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.747 |  |
| ap-southeast-3 | 0.905 |  |
| ap-southeast-4 | 0.787 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.846 |  |
| ap-southeast-7 | 0.957 |  |
| ca-central-1 | 0.136 | 16 |
| ca-west-1 | 0.292 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.450 |  |
| eu-north-1 | 0.485 |  |
| eu-south-1 | 0.454 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.355 |  |
| eu-west-2 | 0.388 |  |
| eu-west-3 | 0.403 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.790 |  |
| me-south-1 | 0.829 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.537 |  |
| us-east-1 | 0.094 | 4369 |
| us-east-2 | 0.121 | 1457 |
| us-gov-east-1 | 0.106 | 1607 |
| us-gov-west-1 | 0.270 | 190 |
| us-west-1 | 0.226 | 3305 |
| us-west-2 | 0.277 | 151 |

