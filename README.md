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
Updated: 2026-03-03T20:25:42.049439+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.972 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.676 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.576 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.808 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.870 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.787 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.197 | 16 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.480 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.405 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.661 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.821 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.149 | 4213 |
| us-east-2 | 0.164 | 1396 |
| us-gov-east-1 | 0.163 | 1527 |
| us-gov-west-1 | 0.217 | 169 |
| us-west-1 | 0.167 | 3167 |
| us-west-2 | 0.215 | 137 |

