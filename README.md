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
Updated: 2026-02-14T15:18:36.330977+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.799 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.604 |  |
| ap-northeast-2 | 0.716 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.854 |  |
| ap-southeast-2 | 0.790 |  |
| ap-southeast-3 | 0.934 |  |
| ap-southeast-4 | 0.833 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.843 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.432 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.436 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.369 |  |
| eu-west-3 | 0.399 |  |
| il-central-1 | 0.584 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.758 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.515 |  |
| us-east-1 | 0.070 | 4121 |
| us-east-2 | 0.079 | 1339 |
| us-gov-east-1 | 0.081 | 1465 |
| us-gov-west-1 | 0.294 | 147 |
| us-west-1 | 0.268 | 3059 |
| us-west-2 | 0.295 | 125 |

