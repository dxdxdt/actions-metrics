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
Updated: 2026-04-05T01:47:33.762281+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.032 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.613 |  |
| ap-northeast-1 | 0.495 |  |
| ap-northeast-2 | 0.598 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.678 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.852 |  |
| ca-central-1 | 0.230 | 16 |
| ca-west-1 | 0.191 |  |
| eu-central-1 | 0.541 |  |
| eu-central-2 | 0.558 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.581 |  |
| eu-west-1 | 0.470 |  |
| eu-west-2 | 0.498 |  |
| eu-west-3 | 0.529 |  |
| il-central-1 | 0.725 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.650 |  |
| us-east-1 | 0.197 | 4434 |
| us-east-2 | 0.169 | 1482 |
| us-gov-east-1 | 0.169 | 1628 |
| us-gov-west-1 | 0.158 | 191 |
| us-west-1 | 0.103 | 3356 |
| us-west-2 | 0.161 | 153 |

