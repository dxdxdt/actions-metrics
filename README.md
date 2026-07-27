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
Updated: 2026-07-27T06:19:51.524945+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.495 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.521 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.662 |  |
| ap-southeast-3 | 0.810 |  |
| ap-southeast-4 | 0.705 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.700 |  |
| ap-southeast-7 | 0.858 |  |
| ca-central-1 | 0.244 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.534 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.550 |  |
| eu-west-1 | 0.434 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.674 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.628 |  |
| us-east-1 | 0.184 | 4914 |
| us-east-2 | 0.184 | 1667 |
| us-gov-east-1 | 0.176 | 1780 |
| us-gov-west-1 | 0.185 | 207 |
| us-west-1 | 0.124 | 3842 |
| us-west-2 | 0.188 | 170 |

