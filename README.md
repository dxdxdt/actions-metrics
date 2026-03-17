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
Updated: 2026-03-17T17:01:37.398526+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.665 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.953 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.829 |  |
| ap-southeast-6 | 0.781 |  |
| ap-southeast-7 | 0.912 |  |
| ca-central-1 | 0.140 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.480 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.449 |  |
| il-central-1 | 0.628 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.798 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.560 |  |
| us-east-1 | 0.112 | 4297 |
| us-east-2 | 0.120 | 1430 |
| us-gov-east-1 | 0.106 | 1584 |
| us-gov-west-1 | 0.222 | 187 |
| us-west-1 | 0.216 | 3246 |
| us-west-2 | 0.215 | 148 |

