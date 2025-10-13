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
Updated: 2025-10-13T11:11:46.548878+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.748 |  |
| ap-northeast-1 | 0.553 |  |
| ap-northeast-2 | 0.659 |  |
| ap-south-1 | 0.973 |  |
| ap-southeast-1 | 0.803 |  |
| ap-southeast-2 | 0.709 |  |
| ca-central-1 | 0.139 | 15 |
| eu-central-1 | 0.477 |  |
| eu-north-1 | 0.507 |  |
| eu-south-1 | 0.489 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.445 |  |
| me-south-1 | 0.779 |  |
| sa-east-1 | 0.581 |  |
| us-east-1 | 0.119 | 3280 |
| us-east-2 | 0.098 | 899 |
| us-gov-east-1 | 0.110 | 1075 |
| us-gov-west-1 | 0.203 | 51 |
| us-west-1 | 0.206 | 2211 |
| us-west-2 | 0.204 | 21 |

