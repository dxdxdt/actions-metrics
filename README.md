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
Updated: 2026-06-01T04:24:56.957208+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.003 |  |
| ap-east-1 | 0.676 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.600 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.652 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.694 |  |
| ap-southeast-5 | 0.775 |  |
| ap-southeast-6 | 0.691 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.259 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.536 |  |
| eu-north-1 | 0.556 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.548 |  |
| eu-west-1 | 0.433 |  |
| eu-west-2 | 0.491 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.669 |  |
| me-central-1 | 0.951 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.184 | 4710 |
| us-east-2 | 0.214 | 1617 |
| us-gov-east-1 | 0.192 | 1708 |
| us-gov-west-1 | 0.184 | 196 |
| us-west-1 | 0.123 | 3627 |
| us-west-2 | 0.182 | 161 |

