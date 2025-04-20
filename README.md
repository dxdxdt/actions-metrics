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
Updated: 2025-04-20T16:13:40.602185+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.754 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.659 |  |
| ap-south-1 | 0.885 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.707 |  |
| ca-central-1 | 0.144 | 10 |
| eu-central-1 | 0.490 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.501 |  |
| eu-west-1 | 0.397 |  |
| eu-west-2 | 0.438 |  |
| eu-west-3 | 0.456 |  |
| me-south-1 | 0.832 |  |
| sa-east-1 | 0.580 |  |
| us-east-1 | 0.126 | 1634 |
| us-east-2 | 0.109 | 406 |
| us-gov-east-1 | 0.101 | 436 |
| us-gov-west-1 | 0.210 | 1 |
| us-west-1 | 0.204 | 1136 |
| us-west-2 | 0.208 |  |

