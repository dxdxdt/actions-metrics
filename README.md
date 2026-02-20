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
Updated: 2026-02-20T15:32:10.469846+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.912 |  |
| ap-east-1 | 0.768 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.592 |  |
| ap-northeast-2 | 0.701 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.958 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.760 |  |
| ap-southeast-3 | 0.900 |  |
| ap-southeast-4 | 0.798 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.803 |  |
| ap-southeast-7 | 0.953 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.421 |  |
| eu-central-2 | 0.435 |  |
| eu-north-1 | 0.469 |  |
| eu-south-1 | 0.444 |  |
| eu-south-2 | 0.459 |  |
| eu-west-1 | 0.343 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.403 |  |
| il-central-1 | 0.591 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.768 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.536 |  |
| us-east-1 | 0.079 | 4154 |
| us-east-2 | 0.086 | 1358 |
| us-gov-east-1 | 0.093 | 1493 |
| us-gov-west-1 | 0.266 | 159 |
| us-west-1 | 0.240 | 3085 |
| us-west-2 | 0.259 | 129 |

