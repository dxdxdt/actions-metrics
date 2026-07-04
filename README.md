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
Updated: 2026-07-04T20:45:31.479056+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.591 |  |
| ap-northeast-2 | 0.691 |  |
| ap-northeast-3 | 0.616 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.842 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.896 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.860 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.148 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.471 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.493 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.440 |  |
| il-central-1 | 0.611 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.542 |  |
| us-east-1 | 0.099 | 4820 |
| us-east-2 | 0.111 | 1652 |
| us-gov-east-1 | 0.114 | 1729 |
| us-gov-west-1 | 0.259 | 200 |
| us-west-1 | 0.213 | 3740 |
| us-west-2 | 0.259 | 164 |

