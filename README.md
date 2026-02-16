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
Updated: 2026-02-16T18:33:54.248947+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.888 |  |
| ap-east-1 | 0.816 |  |
| ap-east-2 | 0.744 |  |
| ap-northeast-1 | 0.637 |  |
| ap-northeast-2 | 0.754 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.889 |  |
| ap-southeast-2 | 0.798 |  |
| ap-southeast-3 | 0.951 |  |
| ap-southeast-4 | 0.839 |  |
| ap-southeast-5 | 0.909 |  |
| ap-southeast-6 | 0.861 |  |
| ap-southeast-7 | 1.002 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.398 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.427 |  |
| eu-south-2 | 0.435 |  |
| eu-west-1 | 0.324 |  |
| eu-west-2 | 0.357 |  |
| eu-west-3 | 0.381 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.788 |  |
| me-south-1 | 0.761 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.522 |  |
| us-east-1 | 0.060 | 4132 |
| us-east-2 | 0.086 | 1348 |
| us-gov-east-1 | 0.084 | 1480 |
| us-gov-west-1 | 0.312 | 149 |
| us-west-1 | 0.279 | 3065 |
| us-west-2 | 0.313 | 126 |

