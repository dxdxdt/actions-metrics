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
Updated: 2026-02-28T13:32:16.470120+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.720 |  |
| ap-northeast-1 | 0.613 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.764 |  |
| ap-southeast-3 | 0.920 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.852 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.128 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.402 |  |
| eu-central-2 | 0.427 |  |
| eu-north-1 | 0.456 |  |
| eu-south-1 | 0.431 |  |
| eu-south-2 | 0.441 |  |
| eu-west-1 | 0.325 |  |
| eu-west-2 | 0.362 |  |
| eu-west-3 | 0.381 |  |
| il-central-1 | 0.578 |  |
| me-central-1 | 0.782 |  |
| me-south-1 | 0.736 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.506 |  |
| us-east-1 | 0.075 | 4199 |
| us-east-2 | 0.112 | 1383 |
| us-gov-east-1 | 0.105 | 1518 |
| us-gov-west-1 | 0.289 | 165 |
| us-west-1 | 0.240 | 3141 |
| us-west-2 | 0.290 | 133 |

