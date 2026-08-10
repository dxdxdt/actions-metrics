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
Updated: 2026-08-10T17:44:48.390436+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.985 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.719 |  |
| ap-southeast-3 | 0.880 |  |
| ap-southeast-4 | 0.761 |  |
| ap-southeast-5 | 0.842 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.928 |  |
| ca-central-1 | 0.177 | 18 |
| ca-west-1 | 0.282 |  |
| eu-central-1 | 0.455 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.501 |  |
| eu-south-1 | 0.480 |  |
| eu-south-2 | 0.489 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.411 |  |
| eu-west-3 | 0.435 |  |
| il-central-1 | 0.616 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.129 | 4970 |
| us-east-2 | 0.142 | 1678 |
| us-gov-east-1 | 0.136 | 1816 |
| us-gov-west-1 | 0.241 | 216 |
| us-west-1 | 0.183 | 3917 |
| us-west-2 | 0.241 | 176 |

