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
Updated: 2026-10-21T19:49:44.069829+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.918 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.697 |  |
| ap-northeast-1 | 0.575 |  |
| ap-northeast-2 | 0.675 |  |
| ap-northeast-3 | 0.607 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.979 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.815 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.790 |  |
| ap-southeast-7 | 0.936 |  |
| ca-central-1 | 0.122 | 18 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.485 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.468 |  |
| eu-south-2 | 0.441 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.423 |  |
| il-central-1 | 0.598 |  |
| me-central-1 | 0.824 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.532 |  |
| us-east-1 | 0.086 | 5157 |
| us-east-2 | 0.116 | 1704 |
| us-gov-east-1 | 0.111 | 1951 |
| us-gov-west-1 | 0.257 | 239 |
| us-west-1 | 0.197 | 4182 |
| us-west-2 | 0.255 | 195 |

