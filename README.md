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
Updated: 2026-06-07T10:07:56.283062+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.019 |  |
| ap-east-1 | 0.676 |  |
| ap-east-2 | 0.615 |  |
| ap-northeast-1 | 0.495 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.520 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.644 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.681 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.671 |  |
| ap-southeast-7 | 0.852 |  |
| ca-central-1 | 0.245 | 16 |
| ca-west-1 | 0.284 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.569 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.583 |  |
| eu-south-2 | 0.571 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.493 |  |
| eu-west-3 | 0.518 |  |
| il-central-1 | 0.682 |  |
| me-central-1 | 0.964 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.649 |  |
| us-east-1 | 0.206 | 4730 |
| us-east-2 | 0.197 | 1627 |
| us-gov-east-1 | 0.180 | 1709 |
| us-gov-west-1 | 0.163 | 197 |
| us-west-1 | 0.106 | 3642 |
| us-west-2 | 0.163 | 162 |

