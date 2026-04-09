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
Updated: 2026-04-09T13:05:27.154188+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.788 |  |
| ap-east-2 | 0.727 |  |
| ap-northeast-1 | 0.620 |  |
| ap-northeast-2 | 0.719 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.873 |  |
| ap-southeast-2 | 0.783 |  |
| ap-southeast-3 | 0.926 |  |
| ap-southeast-4 | 0.835 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.825 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.109 | 16 |
| ca-west-1 | 0.283 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.430 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.440 |  |
| eu-south-2 | 0.436 |  |
| eu-west-1 | 0.336 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.385 |  |
| il-central-1 | 0.587 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.067 | 4465 |
| us-east-2 | 0.090 | 1489 |
| us-gov-east-1 | 0.084 | 1636 |
| us-gov-west-1 | 0.302 | 192 |
| us-west-1 | 0.247 | 3382 |
| us-west-2 | 0.302 | 154 |

