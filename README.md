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
Updated: 2026-08-11T09:53:07.757394+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.667 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.490 |  |
| ap-northeast-2 | 0.596 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.743 |  |
| ap-southeast-2 | 0.634 |  |
| ap-southeast-3 | 0.800 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.674 |  |
| ap-southeast-7 | 0.851 |  |
| ca-central-1 | 0.251 | 18 |
| ca-west-1 | 0.186 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.563 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.564 |  |
| eu-south-2 | 0.570 |  |
| eu-west-1 | 0.458 |  |
| eu-west-2 | 0.492 |  |
| eu-west-3 | 0.508 |  |
| il-central-1 | 0.690 |  |
| me-central-1 | 0.944 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.649 |  |
| us-east-1 | 0.208 | 4974 |
| us-east-2 | 0.201 | 1679 |
| us-gov-east-1 | 0.180 | 1820 |
| us-gov-west-1 | 0.159 | 216 |
| us-west-1 | 0.100 | 3921 |
| us-west-2 | 0.157 | 176 |

