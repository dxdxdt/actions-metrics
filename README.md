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
Updated: 2026-08-16T18:17:11.740944+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.559 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.582 |  |
| ap-south-1 | 0.872 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.721 |  |
| ap-southeast-3 | 0.866 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.832 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.183 | 18 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.484 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.384 |  |
| eu-west-2 | 0.434 |  |
| eu-west-3 | 0.445 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.574 |  |
| us-east-1 | 0.126 | 5009 |
| us-east-2 | 0.144 | 1679 |
| us-gov-east-1 | 0.142 | 1834 |
| us-gov-west-1 | 0.231 | 224 |
| us-west-1 | 0.180 | 3967 |
| us-west-2 | 0.231 | 180 |

