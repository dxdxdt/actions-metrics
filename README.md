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
Updated: 2026-04-17T06:54:18.551213+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.969 |  |
| ap-east-1 | 0.732 |  |
| ap-east-2 | 0.748 |  |
| ap-northeast-1 | 0.549 |  |
| ap-northeast-2 | 0.670 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.695 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.749 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.910 |  |
| ca-central-1 | 0.210 | 16 |
| ca-west-1 | 0.284 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.497 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.507 |  |
| eu-south-2 | 0.511 |  |
| eu-west-1 | 0.395 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.659 |  |
| me-central-1 | 0.917 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.592 |  |
| us-east-1 | 0.145 | 4513 |
| us-east-2 | 0.167 | 1506 |
| us-gov-east-1 | 0.155 | 1652 |
| us-gov-west-1 | 0.217 | 193 |
| us-west-1 | 0.168 | 3425 |
| us-west-2 | 0.226 | 156 |

