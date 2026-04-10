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
Updated: 2026-04-10T16:42:20.959876+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.554 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.833 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.799 |  |
| ap-southeast-6 | 0.737 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.184 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.503 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.572 |  |
| eu-south-1 | 0.535 |  |
| eu-south-2 | 0.534 |  |
| eu-west-1 | 0.421 |  |
| eu-west-2 | 0.469 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.674 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.616 |  |
| us-east-1 | 0.156 | 4472 |
| us-east-2 | 0.128 | 1491 |
| us-gov-east-1 | 0.136 | 1638 |
| us-gov-west-1 | 0.200 | 192 |
| us-west-1 | 0.157 | 3388 |
| us-west-2 | 0.192 | 155 |

