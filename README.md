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
Updated: 2026-03-02T15:35:30.145502+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.939 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.704 |  |
| ap-northeast-1 | 0.575 |  |
| ap-northeast-2 | 0.688 |  |
| ap-northeast-3 | 0.606 |  |
| ap-south-1 | 0.860 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.752 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.847 |  |
| ap-southeast-6 | 0.795 |  |
| ap-southeast-7 | 0.928 |  |
| ca-central-1 | 0.166 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.465 |  |
| eu-north-1 | 0.501 |  |
| eu-south-1 | 0.480 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.408 |  |
| eu-west-3 | 0.425 |  |
| il-central-1 | 0.627 |  |
| me-central-1 | 0.822 |  |
| me-south-1 | 0.801 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.554 |  |
| us-east-1 | 0.112 | 4210 |
| us-east-2 | 0.120 | 1390 |
| us-gov-east-1 | 0.137 | 1522 |
| us-gov-west-1 | 0.263 | 167 |
| us-west-1 | 0.215 | 3158 |
| us-west-2 | 0.264 | 136 |

