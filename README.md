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
Updated: 2026-09-09T23:43:07.742933+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.970 |  |
| ap-east-1 | 0.716 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.541 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.557 |  |
| ap-south-1 | 0.928 |  |
| ap-south-2 | 0.961 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.692 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.725 |  |
| ap-southeast-7 | 0.894 |  |
| ca-central-1 | 0.201 | 18 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.540 |  |
| eu-south-1 | 0.532 |  |
| eu-south-2 | 0.539 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.446 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.888 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.277 |  |
| sa-east-1 | 0.596 |  |
| us-east-1 | 0.156 | 5094 |
| us-east-2 | 0.160 | 1685 |
| us-gov-east-1 | 0.151 | 1904 |
| us-gov-west-1 | 0.212 | 233 |
| us-west-1 | 0.159 | 4094 |
| us-west-2 | 0.209 | 192 |

