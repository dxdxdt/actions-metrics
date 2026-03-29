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
Updated: 2026-03-29T17:24:17.447638+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.600 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.739 |  |
| ap-southeast-3 | 0.885 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.847 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.938 |  |
| ca-central-1 | 0.157 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.459 |  |
| eu-central-2 | 0.466 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.468 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.403 |  |
| eu-west-3 | 0.429 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.792 |  |
| mx-central-1 | 0.198 |  |
| sa-east-1 | 0.559 |  |
| us-east-1 | 0.097 | 4392 |
| us-east-2 | 0.076 | 1465 |
| us-gov-east-1 | 0.087 | 1613 |
| us-gov-west-1 | 0.254 | 190 |
| us-west-1 | 0.198 | 3317 |
| us-west-2 | 0.255 | 152 |

