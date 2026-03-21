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
Updated: 2026-03-21T10:19:46.920632+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.884 |  |
| ap-east-1 | 0.799 |  |
| ap-east-2 | 0.738 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.720 |  |
| ap-northeast-3 | 0.638 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.866 |  |
| ap-southeast-2 | 0.779 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.825 |  |
| ap-southeast-5 | 0.885 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.302 |  |
| eu-central-1 | 0.396 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.432 |  |
| eu-south-2 | 0.428 |  |
| eu-west-1 | 0.326 |  |
| eu-west-2 | 0.357 |  |
| eu-west-3 | 0.374 |  |
| il-central-1 | 0.587 |  |
| me-central-1 | 0.779 |  |
| me-south-1 | 0.741 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.497 |  |
| us-east-1 | 0.068 | 4321 |
| us-east-2 | 0.086 | 1445 |
| us-gov-east-1 | 0.099 | 1591 |
| us-gov-west-1 | 0.291 | 189 |
| us-west-1 | 0.255 | 3271 |
| us-west-2 | 0.295 | 149 |

