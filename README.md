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
Updated: 2026-08-05T01:59:51.279445+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.792 |  |
| ap-east-2 | 0.719 |  |
| ap-northeast-1 | 0.605 |  |
| ap-northeast-2 | 0.706 |  |
| ap-northeast-3 | 0.630 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.867 |  |
| ap-southeast-2 | 0.747 |  |
| ap-southeast-3 | 0.906 |  |
| ap-southeast-4 | 0.790 |  |
| ap-southeast-5 | 0.884 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.150 | 17 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.436 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.446 |  |
| eu-south-2 | 0.454 |  |
| eu-west-1 | 0.343 |  |
| eu-west-2 | 0.375 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.806 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.525 |  |
| us-east-1 | 0.092 | 4941 |
| us-east-2 | 0.110 | 1674 |
| us-gov-east-1 | 0.122 | 1801 |
| us-gov-west-1 | 0.277 | 211 |
| us-west-1 | 0.219 | 3884 |
| us-west-2 | 0.278 | 172 |

