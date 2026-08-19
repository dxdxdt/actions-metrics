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
Updated: 2026-08-19T19:19:40.940016+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.787 |  |
| ap-east-2 | 0.731 |  |
| ap-northeast-1 | 0.612 |  |
| ap-northeast-2 | 0.716 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.858 |  |
| ap-southeast-2 | 0.760 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.815 |  |
| ap-southeast-5 | 0.882 |  |
| ap-southeast-6 | 0.801 |  |
| ap-southeast-7 | 0.968 |  |
| ca-central-1 | 0.111 | 18 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.427 |  |
| eu-north-1 | 0.449 |  |
| eu-south-1 | 0.431 |  |
| eu-south-2 | 0.444 |  |
| eu-west-1 | 0.328 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.399 |  |
| il-central-1 | 0.562 |  |
| me-central-1 | 0.785 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.512 |  |
| us-east-1 | 0.071 | 5024 |
| us-east-2 | 0.088 | 1680 |
| us-gov-east-1 | 0.083 | 1856 |
| us-gov-west-1 | 0.294 | 224 |
| us-west-1 | 0.237 | 3997 |
| us-west-2 | 0.295 | 182 |

