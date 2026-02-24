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
Updated: 2026-02-24T14:06:58.744054+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.881 |  |
| ap-east-1 | 0.800 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.731 |  |
| ap-northeast-3 | 0.650 |  |
| ap-south-1 | 0.844 |  |
| ap-south-2 | 0.916 |  |
| ap-southeast-1 | 0.880 |  |
| ap-southeast-2 | 0.788 |  |
| ap-southeast-3 | 0.939 |  |
| ap-southeast-4 | 0.828 |  |
| ap-southeast-5 | 0.905 |  |
| ap-southeast-6 | 0.885 |  |
| ap-southeast-7 | 0.991 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.383 |  |
| eu-central-2 | 0.412 |  |
| eu-north-1 | 0.446 |  |
| eu-south-1 | 0.418 |  |
| eu-south-2 | 0.418 |  |
| eu-west-1 | 0.312 |  |
| eu-west-2 | 0.347 |  |
| eu-west-3 | 0.363 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.787 |  |
| me-south-1 | 0.741 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.489 |  |
| us-east-1 | 0.059 | 4178 |
| us-east-2 | 0.082 | 1374 |
| us-gov-east-1 | 0.098 | 1504 |
| us-gov-west-1 | 0.311 | 161 |
| us-west-1 | 0.253 | 3111 |
| us-west-2 | 0.318 | 130 |

