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
Updated: 2026-02-09T20:37:38.743654+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.044 |  |
| ap-east-1 | 0.651 |  |
| ap-northeast-1 | 0.468 |  |
| ap-northeast-2 | 0.570 |  |
| ap-south-1 | 0.945 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.725 |  |
| ap-southeast-2 | 0.625 |  |
| ap-southeast-3 | 0.780 |  |
| ap-southeast-4 | 0.665 |  |
| ca-central-1 | 0.260 | 16 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.543 |  |
| eu-central-2 | 0.562 |  |
| eu-north-1 | 0.601 |  |
| eu-south-1 | 0.589 |  |
| eu-south-2 | 0.593 |  |
| eu-west-1 | 0.471 |  |
| eu-west-2 | 0.518 |  |
| eu-west-3 | 0.548 |  |
| il-central-1 | 0.728 |  |
| me-central-1 | 0.928 |  |
| me-south-1 | 0.901 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.210 | 4093 |
| us-east-2 | 0.188 | 1326 |
| us-gov-east-1 | 0.186 | 1446 |
| us-gov-west-1 | 0.131 | 142 |
| us-west-1 | 0.112 | 3031 |
| us-west-2 | 0.136 | 125 |

