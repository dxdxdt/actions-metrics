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
Updated: 2026-06-07T07:01:08.515817+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.681 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.499 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.521 |  |
| ap-south-1 | 0.884 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.767 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.810 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.668 |  |
| ap-southeast-7 | 0.860 |  |
| ca-central-1 | 0.250 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.542 |  |
| eu-central-2 | 0.580 |  |
| eu-north-1 | 0.590 |  |
| eu-south-1 | 0.592 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.465 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.526 |  |
| il-central-1 | 0.699 |  |
| me-central-1 | 0.954 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.206 | 4730 |
| us-east-2 | 0.184 | 1627 |
| us-gov-east-1 | 0.198 | 1709 |
| us-gov-west-1 | 0.162 | 197 |
| us-west-1 | 0.105 | 3641 |
| us-west-2 | 0.164 | 162 |

