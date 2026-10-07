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
Updated: 2026-10-07T00:16:54.961401+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.706 |  |
| ap-northeast-3 | 0.627 |  |
| ap-south-1 | 0.832 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.867 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.798 |  |
| ap-southeast-5 | 0.880 |  |
| ap-southeast-6 | 0.811 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.128 | 18 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.411 |  |
| eu-central-2 | 0.426 |  |
| eu-north-1 | 0.468 |  |
| eu-south-1 | 0.443 |  |
| eu-south-2 | 0.426 |  |
| eu-west-1 | 0.331 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.392 |  |
| il-central-1 | 0.565 |  |
| me-central-1 | 0.774 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.513 |  |
| us-east-1 | 0.080 | 5140 |
| us-east-2 | 0.105 | 1690 |
| us-gov-east-1 | 0.111 | 1934 |
| us-gov-west-1 | 0.278 | 237 |
| us-west-1 | 0.226 | 4159 |
| us-west-2 | 0.279 | 193 |

