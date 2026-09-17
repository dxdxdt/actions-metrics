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
Updated: 2026-09-17T17:59:39.045310+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.086 |  |
| ap-east-1 | 0.617 |  |
| ap-east-2 | 0.556 |  |
| ap-northeast-1 | 0.439 |  |
| ap-northeast-2 | 0.548 |  |
| ap-northeast-3 | 0.466 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.860 |  |
| ap-southeast-1 | 0.713 |  |
| ap-southeast-2 | 0.569 |  |
| ap-southeast-3 | 0.750 |  |
| ap-southeast-4 | 0.611 |  |
| ap-southeast-5 | 0.712 |  |
| ap-southeast-6 | 0.615 |  |
| ap-southeast-7 | 0.794 |  |
| ca-central-1 | 0.307 | 18 |
| ca-west-1 | 0.168 |  |
| eu-central-1 | 0.609 |  |
| eu-central-2 | 0.629 |  |
| eu-north-1 | 0.653 |  |
| eu-south-1 | 0.637 |  |
| eu-south-2 | 0.648 |  |
| eu-west-1 | 0.532 |  |
| eu-west-2 | 0.568 |  |
| eu-west-3 | 0.582 |  |
| il-central-1 | 0.770 |  |
| me-central-1 | 0.988 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.718 |  |
| us-east-1 | 0.276 | 5103 |
| us-east-2 | 0.276 | 1686 |
| us-gov-east-1 | 0.248 | 1914 |
| us-gov-west-1 | 0.096 | 234 |
| us-west-1 | 0.041 | 4122 |
| us-west-2 | 0.096 | 192 |

