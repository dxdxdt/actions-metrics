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
Updated: 2026-04-15T19:25:42.440976+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.763 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.605 |  |
| ap-northeast-2 | 0.686 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.761 |  |
| ap-southeast-3 | 0.902 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.878 |  |
| ap-southeast-6 | 0.795 |  |
| ap-southeast-7 | 0.944 |  |
| ca-central-1 | 0.139 | 16 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.489 |  |
| eu-south-1 | 0.463 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.362 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.611 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.094 | 4507 |
| us-east-2 | 0.098 | 1501 |
| us-gov-east-1 | 0.105 | 1649 |
| us-gov-west-1 | 0.282 | 193 |
| us-west-1 | 0.239 | 3418 |
| us-west-2 | 0.280 | 156 |

