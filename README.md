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
Updated: 2026-08-15T03:32:25.254123+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.659 |  |
| ap-east-2 | 0.601 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.589 |  |
| ap-northeast-3 | 0.512 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.738 |  |
| ap-southeast-2 | 0.621 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.667 |  |
| ap-southeast-5 | 0.759 |  |
| ap-southeast-6 | 0.671 |  |
| ap-southeast-7 | 0.844 |  |
| ca-central-1 | 0.280 | 18 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.541 |  |
| eu-central-2 | 0.568 |  |
| eu-north-1 | 0.586 |  |
| eu-south-1 | 0.576 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.507 |  |
| eu-west-3 | 0.530 |  |
| il-central-1 | 0.708 |  |
| me-central-1 | 0.918 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.656 |  |
| us-east-1 | 0.216 | 4998 |
| us-east-2 | 0.229 | 1679 |
| us-gov-east-1 | 0.209 | 1828 |
| us-gov-west-1 | 0.151 | 222 |
| us-west-1 | 0.093 | 3951 |
| us-west-2 | 0.154 | 177 |

