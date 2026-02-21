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
Updated: 2026-02-21T01:17:32.446013+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.912 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.711 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.796 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.841 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.434 |  |
| eu-north-1 | 0.460 |  |
| eu-south-1 | 0.440 |  |
| eu-south-2 | 0.449 |  |
| eu-west-1 | 0.336 |  |
| eu-west-2 | 0.372 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.799 |  |
| me-south-1 | 0.754 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.075 | 4156 |
| us-east-2 | 0.080 | 1359 |
| us-gov-east-1 | 0.088 | 1495 |
| us-gov-west-1 | 0.269 | 160 |
| us-west-1 | 0.242 | 3088 |
| us-west-2 | 0.279 | 129 |

