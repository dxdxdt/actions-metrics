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
Updated: 2026-03-13T06:42:04.377972+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.891 |  |
| ap-east-1 | 0.811 |  |
| ap-east-2 | 0.743 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.736 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.932 |  |
| ap-southeast-4 | 0.841 |  |
| ap-southeast-5 | 0.905 |  |
| ap-southeast-6 | 0.839 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.399 |  |
| eu-central-2 | 0.418 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.442 |  |
| eu-west-1 | 0.325 |  |
| eu-west-2 | 0.363 |  |
| eu-west-3 | 0.386 |  |
| il-central-1 | 0.580 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.736 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.064 | 4274 |
| us-east-2 | 0.089 | 1422 |
| us-gov-east-1 | 0.089 | 1566 |
| us-gov-west-1 | 0.295 | 180 |
| us-west-1 | 0.266 | 3217 |
| us-west-2 | 0.294 | 145 |

