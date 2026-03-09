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
Updated: 2026-03-09T14:57:38.607912+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.909 |  |
| ap-east-1 | 0.778 |  |
| ap-east-2 | 0.788 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.709 |  |
| ap-northeast-3 | 0.620 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.920 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.917 |  |
| ap-southeast-4 | 0.789 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.853 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.425 |  |
| eu-central-2 | 0.446 |  |
| eu-north-1 | 0.481 |  |
| eu-south-1 | 0.455 |  |
| eu-south-2 | 0.462 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.406 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.782 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.516 |  |
| us-east-1 | 0.081 | 4248 |
| us-east-2 | 0.104 | 1412 |
| us-gov-east-1 | 0.113 | 1547 |
| us-gov-west-1 | 0.265 | 176 |
| us-west-1 | 0.237 | 3201 |
| us-west-2 | 0.267 | 144 |

