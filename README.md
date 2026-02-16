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
Updated: 2026-02-16T04:17:23.898602+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.729 |  |
| ap-east-2 | 0.654 |  |
| ap-northeast-1 | 0.542 |  |
| ap-northeast-2 | 0.646 |  |
| ap-south-1 | 0.938 |  |
| ap-south-2 | 0.973 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.707 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.506 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.504 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.656 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.825 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.140 | 4127 |
| us-east-2 | 0.108 | 1348 |
| us-gov-east-1 | 0.111 | 1475 |
| us-gov-west-1 | 0.196 | 149 |
| us-west-1 | 0.207 | 3063 |
| us-west-2 | 0.195 | 125 |

