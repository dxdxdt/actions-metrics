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
Updated: 2026-08-24T17:24:10.985032+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.020 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.616 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.604 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.682 |  |
| ap-southeast-5 | 0.775 |  |
| ap-southeast-6 | 0.687 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.240 | 18 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.571 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.557 |  |
| eu-south-2 | 0.560 |  |
| eu-west-1 | 0.459 |  |
| eu-west-2 | 0.482 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.682 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.658 |  |
| us-east-1 | 0.212 | 5053 |
| us-east-2 | 0.196 | 1683 |
| us-gov-east-1 | 0.175 | 1880 |
| us-gov-west-1 | 0.162 | 227 |
| us-west-1 | 0.107 | 4046 |
| us-west-2 | 0.161 | 186 |

