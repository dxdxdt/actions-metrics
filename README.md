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
Updated: 2026-03-26T04:27:28.602079+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.902 |  |
| ap-east-1 | 0.788 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.612 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.641 |  |
| ap-south-1 | 0.846 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.868 |  |
| ap-southeast-2 | 0.781 |  |
| ap-southeast-3 | 0.912 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.875 |  |
| ap-southeast-7 | 0.975 |  |
| ca-central-1 | 0.109 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.414 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.428 |  |
| eu-south-2 | 0.448 |  |
| eu-west-1 | 0.334 |  |
| eu-west-2 | 0.363 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.779 |  |
| me-south-1 | 0.738 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.509 |  |
| us-east-1 | 0.067 | 4360 |
| us-east-2 | 0.086 | 1456 |
| us-gov-east-1 | 0.086 | 1604 |
| us-gov-west-1 | 0.288 | 190 |
| us-west-1 | 0.245 | 3298 |
| us-west-2 | 0.300 | 151 |

