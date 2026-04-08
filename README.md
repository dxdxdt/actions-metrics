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
Updated: 2026-04-08T15:03:07.127247+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.066 |  |
| ap-east-1 | 0.627 |  |
| ap-east-2 | 0.569 |  |
| ap-northeast-1 | 0.456 |  |
| ap-northeast-2 | 0.554 |  |
| ap-northeast-3 | 0.476 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.702 |  |
| ap-southeast-2 | 0.584 |  |
| ap-southeast-3 | 0.760 |  |
| ap-southeast-4 | 0.621 |  |
| ap-southeast-5 | 0.724 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.806 |  |
| ca-central-1 | 0.311 | 16 |
| ca-west-1 | 0.581 |  |
| eu-central-1 | 0.594 |  |
| eu-central-2 | 0.612 |  |
| eu-north-1 | 0.639 |  |
| eu-south-1 | 0.609 |  |
| eu-south-2 | 0.615 |  |
| eu-west-1 | 0.515 |  |
| eu-west-2 | 0.548 |  |
| eu-west-3 | 0.566 |  |
| il-central-1 | 0.769 |  |
| me-central-1 | 0.962 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.705 |  |
| us-east-1 | 0.254 | 4456 |
| us-east-2 | 0.223 | 1489 |
| us-gov-east-1 | 0.226 | 1634 |
| us-gov-west-1 | 0.111 | 192 |
| us-west-1 | 0.055 | 3379 |
| us-west-2 | 0.108 | 154 |

