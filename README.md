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
Updated: 2026-08-15T07:23:26.700429+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.064 |  |
| ap-east-1 | 0.621 |  |
| ap-east-2 | 0.562 |  |
| ap-northeast-1 | 0.445 |  |
| ap-northeast-2 | 0.554 |  |
| ap-northeast-3 | 0.471 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.697 |  |
| ap-southeast-2 | 0.575 |  |
| ap-southeast-3 | 0.754 |  |
| ap-southeast-4 | 0.615 |  |
| ap-southeast-5 | 0.716 |  |
| ap-southeast-6 | 0.621 |  |
| ap-southeast-7 | 0.799 |  |
| ca-central-1 | 0.319 | 18 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.589 |  |
| eu-central-2 | 0.611 |  |
| eu-north-1 | 0.637 |  |
| eu-south-1 | 0.621 |  |
| eu-south-2 | 0.617 |  |
| eu-west-1 | 0.520 |  |
| eu-west-2 | 0.550 |  |
| eu-west-3 | 0.571 |  |
| il-central-1 | 0.752 |  |
| me-central-1 | 0.955 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.711 |  |
| us-east-1 | 0.263 | 4998 |
| us-east-2 | 0.264 | 1679 |
| us-gov-east-1 | 0.235 | 1829 |
| us-gov-west-1 | 0.103 | 222 |
| us-west-1 | 0.044 | 3954 |
| us-west-2 | 0.103 | 177 |

