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
Updated: 2026-04-04T07:44:10.419785+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.705 |  |
| ap-northeast-1 | 0.591 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.612 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.870 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.893 |  |
| ap-southeast-4 | 0.791 |  |
| ap-southeast-5 | 0.862 |  |
| ap-southeast-6 | 0.788 |  |
| ap-southeast-7 | 0.946 |  |
| ca-central-1 | 0.153 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.431 |  |
| eu-central-2 | 0.460 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.456 |  |
| eu-south-2 | 0.464 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.387 |  |
| eu-west-3 | 0.403 |  |
| il-central-1 | 0.606 |  |
| me-central-1 | 0.810 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.100 | 4431 |
| us-east-2 | 0.118 | 1477 |
| us-gov-east-1 | 0.124 | 1625 |
| us-gov-west-1 | 0.259 | 191 |
| us-west-1 | 0.205 | 3350 |
| us-west-2 | 0.270 | 153 |

