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
Updated: 2026-03-06T18:34:48.767856+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.660 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.649 |  |
| ap-northeast-3 | 0.569 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.938 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.737 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.787 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.167 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.503 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.500 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.413 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.477 |  |
| il-central-1 | 0.662 |  |
| me-central-1 | 0.860 |  |
| me-south-1 | 0.825 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.141 | 4232 |
| us-east-2 | 0.118 | 1404 |
| us-gov-east-1 | 0.120 | 1532 |
| us-gov-west-1 | 0.196 | 173 |
| us-west-1 | 0.189 | 3185 |
| us-west-2 | 0.193 | 142 |

