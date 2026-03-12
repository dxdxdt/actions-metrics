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
Updated: 2026-03-12T19:37:58.479377+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.721 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.541 |  |
| ap-northeast-2 | 0.649 |  |
| ap-northeast-3 | 0.568 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.795 |  |
| ap-southeast-2 | 0.703 |  |
| ap-southeast-3 | 0.852 |  |
| ap-southeast-4 | 0.743 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.157 | 16 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.484 |  |
| eu-central-2 | 0.499 |  |
| eu-north-1 | 0.531 |  |
| eu-south-1 | 0.515 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.410 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.466 |  |
| il-central-1 | 0.661 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.815 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.594 |  |
| us-east-1 | 0.138 | 4270 |
| us-east-2 | 0.111 | 1421 |
| us-gov-east-1 | 0.112 | 1566 |
| us-gov-west-1 | 0.202 | 180 |
| us-west-1 | 0.195 | 3215 |
| us-west-2 | 0.197 | 144 |

