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
Updated: 2026-05-17T21:46:43.940300+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.858 |  |
| ap-east-1 | 0.857 |  |
| ap-east-2 | 0.782 |  |
| ap-northeast-1 | 0.665 |  |
| ap-northeast-2 | 0.780 |  |
| ap-northeast-3 | 0.696 |  |
| ap-south-1 | 0.805 |  |
| ap-south-2 | 0.870 |  |
| ap-southeast-1 | 0.919 |  |
| ap-southeast-2 | 0.815 |  |
| ap-southeast-3 | 0.962 |  |
| ap-southeast-4 | 0.857 |  |
| ap-southeast-5 | 0.938 |  |
| ap-southeast-6 | 0.869 |  |
| ap-southeast-7 | 1.014 |  |
| ca-central-1 | 0.099 | 16 |
| ca-west-1 | 0.297 |  |
| eu-central-1 | 0.367 |  |
| eu-central-2 | 0.385 |  |
| eu-north-1 | 0.405 |  |
| eu-south-1 | 0.393 |  |
| eu-south-2 | 0.400 |  |
| eu-west-1 | 0.284 |  |
| eu-west-2 | 0.321 |  |
| eu-west-3 | 0.347 |  |
| il-central-1 | 0.539 |  |
| me-central-1 | 0.748 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.472 |  |
| us-east-1 | 0.040 | 4659 |
| us-east-2 | 0.079 | 1598 |
| us-gov-east-1 | 0.087 | 1697 |
| us-gov-west-1 | 0.349 | 195 |
| us-west-1 | 0.288 | 3572 |
| us-west-2 | 0.347 | 158 |

