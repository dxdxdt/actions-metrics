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
Updated: 2026-04-29T19:12:50.132754+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.932 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.592 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.616 |  |
| ap-south-1 | 0.832 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.844 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.896 |  |
| ap-southeast-4 | 0.817 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.801 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.134 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.449 |  |
| eu-north-1 | 0.488 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.468 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.091 | 4576 |
| us-east-2 | 0.100 | 1546 |
| us-gov-east-1 | 0.102 | 1667 |
| us-gov-west-1 | 0.276 | 194 |
| us-west-1 | 0.222 | 3500 |
| us-west-2 | 0.276 | 157 |

