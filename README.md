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
Updated: 2026-07-05T11:25:24.725760+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.665 |  |
| ap-east-2 | 0.605 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.509 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.740 |  |
| ap-southeast-2 | 0.631 |  |
| ap-southeast-3 | 0.797 |  |
| ap-southeast-4 | 0.679 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.672 |  |
| ap-southeast-7 | 0.845 |  |
| ca-central-1 | 0.273 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.533 |  |
| eu-central-2 | 0.564 |  |
| eu-north-1 | 0.587 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.570 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.496 |  |
| eu-west-3 | 0.512 |  |
| il-central-1 | 0.698 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.200 | 4822 |
| us-east-2 | 0.211 | 1652 |
| us-gov-east-1 | 0.203 | 1729 |
| us-gov-west-1 | 0.169 | 200 |
| us-west-1 | 0.107 | 3745 |
| us-west-2 | 0.169 | 164 |

