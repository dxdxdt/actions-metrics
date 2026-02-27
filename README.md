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
Updated: 2026-02-27T06:42:59.032242+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.034 |  |
| ap-east-1 | 0.678 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.755 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.810 |  |
| ap-southeast-4 | 0.686 |  |
| ap-southeast-5 | 0.773 |  |
| ap-southeast-6 | 0.710 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.252 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.543 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.551 |  |
| eu-south-2 | 0.562 |  |
| eu-west-1 | 0.442 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.503 |  |
| il-central-1 | 0.703 |  |
| me-central-1 | 0.909 |  |
| me-south-1 | 0.868 |  |
| mx-central-1 | 0.268 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.197 | 4193 |
| us-east-2 | 0.193 | 1381 |
| us-gov-east-1 | 0.191 | 1513 |
| us-gov-west-1 | 0.177 | 162 |
| us-west-1 | 0.119 | 3129 |
| us-west-2 | 0.181 | 132 |

