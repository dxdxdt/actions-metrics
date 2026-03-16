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
Updated: 2026-03-16T04:34:44.203654+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.767 |  |
| ap-east-2 | 0.711 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.874 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.136 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.489 |  |
| eu-south-1 | 0.455 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.357 |  |
| eu-west-2 | 0.384 |  |
| eu-west-3 | 0.406 |  |
| il-central-1 | 0.601 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.754 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.088 | 4287 |
| us-east-2 | 0.101 | 1427 |
| us-gov-east-1 | 0.118 | 1577 |
| us-gov-west-1 | 0.265 | 185 |
| us-west-1 | 0.223 | 3240 |
| us-west-2 | 0.266 | 148 |

