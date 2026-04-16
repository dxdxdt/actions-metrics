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
Updated: 2026-04-16T11:54:46.797122+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.920 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.719 |  |
| ap-northeast-1 | 0.600 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.854 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.925 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.824 |  |
| ap-southeast-7 | 0.999 |  |
| ca-central-1 | 0.103 | 16 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.427 |  |
| eu-central-2 | 0.456 |  |
| eu-north-1 | 0.481 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.467 |  |
| eu-west-1 | 0.357 |  |
| eu-west-2 | 0.387 |  |
| eu-west-3 | 0.412 |  |
| il-central-1 | 0.593 |  |
| me-central-1 | 0.800 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.535 |  |
| us-east-1 | 0.077 | 4511 |
| us-east-2 | 0.073 | 1504 |
| us-gov-east-1 | 0.079 | 1651 |
| us-gov-west-1 | 0.284 | 193 |
| us-west-1 | 0.231 | 3419 |
| us-west-2 | 0.285 | 156 |

