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
Updated: 2026-03-27T08:42:38.971766+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.942 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.569 |  |
| ap-northeast-2 | 0.678 |  |
| ap-northeast-3 | 0.598 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.961 |  |
| ap-southeast-1 | 0.825 |  |
| ap-southeast-2 | 0.725 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.846 |  |
| ap-southeast-6 | 0.787 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.166 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.450 |  |
| eu-central-2 | 0.470 |  |
| eu-north-1 | 0.516 |  |
| eu-south-1 | 0.480 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.413 |  |
| eu-west-3 | 0.429 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.827 |  |
| me-south-1 | 0.829 |  |
| mx-central-1 | 0.200 |  |
| sa-east-1 | 0.560 |  |
| us-east-1 | 0.101 | 4369 |
| us-east-2 | 0.101 | 1458 |
| us-gov-east-1 | 0.112 | 1607 |
| us-gov-west-1 | 0.243 | 190 |
| us-west-1 | 0.197 | 3305 |
| us-west-2 | 0.249 | 151 |

