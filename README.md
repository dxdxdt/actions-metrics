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
Updated: 2026-03-13T23:21:26.176558+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.672 |  |
| ap-east-2 | 0.613 |  |
| ap-northeast-1 | 0.491 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.936 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.650 |  |
| ap-southeast-3 | 0.802 |  |
| ap-southeast-4 | 0.692 |  |
| ap-southeast-5 | 0.768 |  |
| ap-southeast-6 | 0.707 |  |
| ap-southeast-7 | 0.851 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.523 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.580 |  |
| eu-south-1 | 0.557 |  |
| eu-south-2 | 0.568 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.498 |  |
| eu-west-3 | 0.505 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 0.900 |  |
| me-south-1 | 0.859 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.181 | 4277 |
| us-east-2 | 0.174 | 1422 |
| us-gov-east-1 | 0.163 | 1572 |
| us-gov-west-1 | 0.163 | 183 |
| us-west-1 | 0.138 | 3221 |
| us-west-2 | 0.165 | 146 |

