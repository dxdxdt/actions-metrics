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
Updated: 2026-09-14T23:38:44.515205+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.672 |  |
| ap-east-2 | 0.616 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.600 |  |
| ap-northeast-3 | 0.522 |  |
| ap-south-1 | 0.888 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.637 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.679 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.674 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.243 | 18 |
| ca-west-1 | 0.180 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.557 |  |
| eu-north-1 | 0.584 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.578 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.499 |  |
| eu-west-3 | 0.513 |  |
| il-central-1 | 0.699 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.254 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.202 | 5099 |
| us-east-2 | 0.212 | 1686 |
| us-gov-east-1 | 0.193 | 1913 |
| us-gov-west-1 | 0.161 | 233 |
| us-west-1 | 0.102 | 4112 |
| us-west-2 | 0.159 | 192 |

