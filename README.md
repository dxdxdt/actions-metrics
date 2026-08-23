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
Updated: 2026-08-23T11:14:23.978186+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.933 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.556 |  |
| ap-northeast-2 | 0.659 |  |
| ap-northeast-3 | 0.580 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.878 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.189 | 18 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.458 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.503 |  |
| eu-south-1 | 0.477 |  |
| eu-south-2 | 0.490 |  |
| eu-west-1 | 0.381 |  |
| eu-west-2 | 0.417 |  |
| eu-west-3 | 0.436 |  |
| il-central-1 | 0.611 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.122 | 5049 |
| us-east-2 | 0.152 | 1681 |
| us-gov-east-1 | 0.148 | 1871 |
| us-gov-west-1 | 0.239 | 225 |
| us-west-1 | 0.182 | 4036 |
| us-west-2 | 0.240 | 184 |

