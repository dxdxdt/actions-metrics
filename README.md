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
Updated: 2026-04-04T04:10:39.202896+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.871 |  |
| ap-east-1 | 0.810 |  |
| ap-east-2 | 0.746 |  |
| ap-northeast-1 | 0.630 |  |
| ap-northeast-2 | 0.749 |  |
| ap-northeast-3 | 0.646 |  |
| ap-south-1 | 0.831 |  |
| ap-south-2 | 0.862 |  |
| ap-southeast-1 | 0.887 |  |
| ap-southeast-2 | 0.810 |  |
| ap-southeast-3 | 0.940 |  |
| ap-southeast-4 | 0.855 |  |
| ap-southeast-5 | 0.899 |  |
| ap-southeast-6 | 0.830 |  |
| ap-southeast-7 | 0.981 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.386 |  |
| eu-central-2 | 0.409 |  |
| eu-north-1 | 0.441 |  |
| eu-south-1 | 0.412 |  |
| eu-south-2 | 0.415 |  |
| eu-west-1 | 0.304 |  |
| eu-west-2 | 0.340 |  |
| eu-west-3 | 0.363 |  |
| il-central-1 | 0.554 |  |
| me-central-1 | 0.760 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.483 |  |
| us-east-1 | 0.052 | 4429 |
| us-east-2 | 0.096 | 1477 |
| us-gov-east-1 | 0.091 | 1625 |
| us-gov-west-1 | 0.313 | 191 |
| us-west-1 | 0.257 | 3349 |
| us-west-2 | 0.318 | 153 |

