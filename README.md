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
Updated: 2026-04-24T15:02:41.354966+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.001 |  |
| ap-east-1 | 0.715 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.530 |  |
| ap-northeast-2 | 0.640 |  |
| ap-northeast-3 | 0.555 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.784 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.828 |  |
| ap-southeast-4 | 0.718 |  |
| ap-southeast-5 | 0.794 |  |
| ap-southeast-6 | 0.710 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.233 | 16 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.508 |  |
| eu-central-2 | 0.528 |  |
| eu-north-1 | 0.556 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.541 |  |
| eu-west-1 | 0.424 |  |
| eu-west-2 | 0.462 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.675 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.626 |  |
| us-east-1 | 0.170 | 4555 |
| us-east-2 | 0.165 | 1528 |
| us-gov-east-1 | 0.182 | 1662 |
| us-gov-west-1 | 0.197 | 194 |
| us-west-1 | 0.141 | 3469 |
| us-west-2 | 0.201 | 157 |

