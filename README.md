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
Updated: 2026-03-02T07:44:03.348868+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.755 |  |
| ap-east-2 | 0.689 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.675 |  |
| ap-northeast-3 | 0.596 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.954 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.774 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.456 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.480 |  |
| eu-south-2 | 0.495 |  |
| eu-west-1 | 0.385 |  |
| eu-west-2 | 0.409 |  |
| eu-west-3 | 0.441 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.828 |  |
| me-south-1 | 0.780 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.553 |  |
| us-east-1 | 0.096 | 4207 |
| us-east-2 | 0.071 | 1389 |
| us-gov-east-1 | 0.071 | 1521 |
| us-gov-west-1 | 0.222 | 167 |
| us-west-1 | 0.236 | 3155 |
| us-west-2 | 0.221 | 136 |

