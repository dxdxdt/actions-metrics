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
Updated: 2026-07-25T20:08:12.896888+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.048 |  |
| ap-east-1 | 0.659 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.580 |  |
| ap-northeast-3 | 0.506 |  |
| ap-south-1 | 0.920 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.631 |  |
| ap-southeast-3 | 0.796 |  |
| ap-southeast-4 | 0.674 |  |
| ap-southeast-5 | 0.769 |  |
| ap-southeast-6 | 0.665 |  |
| ap-southeast-7 | 0.855 |  |
| ca-central-1 | 0.290 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.580 |  |
| eu-central-2 | 0.605 |  |
| eu-north-1 | 0.633 |  |
| eu-south-1 | 0.613 |  |
| eu-south-2 | 0.605 |  |
| eu-west-1 | 0.503 |  |
| eu-west-2 | 0.539 |  |
| eu-west-3 | 0.553 |  |
| il-central-1 | 0.757 |  |
| me-central-1 | 0.951 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.670 |  |
| us-east-1 | 0.242 | 4909 |
| us-east-2 | 0.224 | 1665 |
| us-gov-east-1 | 0.220 | 1777 |
| us-gov-west-1 | 0.163 | 207 |
| us-west-1 | 0.101 | 3833 |
| us-west-2 | 0.162 | 170 |

