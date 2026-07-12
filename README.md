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
Updated: 2026-07-12T21:41:17.877788+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.871 |  |
| ap-east-1 | 0.815 |  |
| ap-east-2 | 0.770 |  |
| ap-northeast-1 | 0.639 |  |
| ap-northeast-2 | 0.742 |  |
| ap-northeast-3 | 0.662 |  |
| ap-south-1 | 0.829 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.892 |  |
| ap-southeast-2 | 0.798 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.846 |  |
| ap-southeast-5 | 0.916 |  |
| ap-southeast-6 | 0.829 |  |
| ap-southeast-7 | 0.992 |  |
| ca-central-1 | 0.097 | 16 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.386 |  |
| eu-central-2 | 0.405 |  |
| eu-north-1 | 0.436 |  |
| eu-south-1 | 0.419 |  |
| eu-south-2 | 0.427 |  |
| eu-west-1 | 0.309 |  |
| eu-west-2 | 0.347 |  |
| eu-west-3 | 0.370 |  |
| il-central-1 | 0.555 |  |
| me-central-1 | 0.756 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.493 |  |
| us-east-1 | 0.050 | 4860 |
| us-east-2 | 0.071 | 1656 |
| us-gov-east-1 | 0.077 | 1741 |
| us-gov-west-1 | 0.314 | 202 |
| us-west-1 | 0.261 | 3772 |
| us-west-2 | 0.315 | 165 |

