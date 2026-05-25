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
Updated: 2026-05-25T14:39:03.068526+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.679 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.607 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.929 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.655 |  |
| ap-southeast-3 | 0.805 |  |
| ap-southeast-4 | 0.690 |  |
| ap-southeast-5 | 0.780 |  |
| ap-southeast-6 | 0.698 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.236 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.531 |  |
| eu-central-2 | 0.570 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.570 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.438 |  |
| eu-west-2 | 0.487 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.697 |  |
| me-central-1 | 0.923 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.644 |  |
| us-east-1 | 0.199 | 4688 |
| us-east-2 | 0.156 | 1611 |
| us-gov-east-1 | 0.169 | 1705 |
| us-gov-west-1 | 0.170 | 195 |
| us-west-1 | 0.117 | 3599 |
| us-west-2 | 0.179 | 160 |

