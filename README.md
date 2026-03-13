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
Updated: 2026-03-13T04:06:03.700697+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.906 |  |
| ap-east-1 | 0.790 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.602 |  |
| ap-northeast-2 | 0.719 |  |
| ap-northeast-3 | 0.628 |  |
| ap-south-1 | 0.850 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.863 |  |
| ap-southeast-2 | 0.748 |  |
| ap-southeast-3 | 0.916 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.788 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.142 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.431 |  |
| eu-north-1 | 0.473 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.380 |  |
| eu-west-3 | 0.396 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.746 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.520 |  |
| us-east-1 | 0.091 | 4273 |
| us-east-2 | 0.119 | 1421 |
| us-gov-east-1 | 0.120 | 1566 |
| us-gov-west-1 | 0.276 | 180 |
| us-west-1 | 0.220 | 3217 |
| us-west-2 | 0.279 | 145 |

