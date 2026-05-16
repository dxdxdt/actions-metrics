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
Updated: 2026-05-16T09:23:51.242326+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.519 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.888 |  |
| ap-south-2 | 0.874 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.791 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.881 |  |
| ca-central-1 | 0.238 | 16 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.523 |  |
| eu-north-1 | 0.548 |  |
| eu-south-1 | 0.529 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.430 |  |
| eu-west-2 | 0.464 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.675 |  |
| me-central-1 | 0.883 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.180 | 4646 |
| us-east-2 | 0.175 | 1595 |
| us-gov-east-1 | 0.199 | 1692 |
| us-gov-west-1 | 0.199 | 195 |
| us-west-1 | 0.145 | 3567 |
| us-west-2 | 0.197 | 158 |

