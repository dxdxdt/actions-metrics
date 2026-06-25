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
Updated: 2026-06-25T08:18:42.527378+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.660 |  |
| ap-northeast-1 | 0.544 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.570 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.939 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.852 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.738 |  |
| ap-southeast-7 | 0.905 |  |
| ca-central-1 | 0.206 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.518 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.393 |  |
| eu-west-2 | 0.430 |  |
| eu-west-3 | 0.449 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.862 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.258 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.144 | 4787 |
| us-east-2 | 0.160 | 1640 |
| us-gov-east-1 | 0.155 | 1720 |
| us-gov-west-1 | 0.227 | 199 |
| us-west-1 | 0.171 | 3702 |
| us-west-2 | 0.227 | 163 |

