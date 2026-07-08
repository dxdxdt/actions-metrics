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
Updated: 2026-07-08T20:58:53.379691+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.915 |  |
| ap-east-1 | 0.776 |  |
| ap-east-2 | 0.719 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.698 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.939 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.742 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.778 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.485 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.483 |  |
| eu-west-1 | 0.368 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.434 |  |
| il-central-1 | 0.593 |  |
| me-central-1 | 0.809 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.543 |  |
| us-east-1 | 0.093 | 4835 |
| us-east-2 | 0.104 | 1656 |
| us-gov-east-1 | 0.091 | 1732 |
| us-gov-west-1 | 0.265 | 201 |
| us-west-1 | 0.210 | 3758 |
| us-west-2 | 0.265 | 164 |

