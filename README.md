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
Updated: 2026-04-18T13:57:38.378269+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.702 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.523 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.977 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.679 |  |
| ap-southeast-3 | 0.841 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.793 |  |
| ap-southeast-6 | 0.744 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.215 | 16 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.487 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.551 |  |
| eu-south-1 | 0.523 |  |
| eu-south-2 | 0.534 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.462 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.691 |  |
| me-central-1 | 0.863 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.616 |  |
| us-east-1 | 0.160 | 4521 |
| us-east-2 | 0.135 | 1510 |
| us-gov-east-1 | 0.175 | 1655 |
| us-gov-west-1 | 0.199 | 194 |
| us-west-1 | 0.145 | 3433 |
| us-west-2 | 0.195 | 156 |

