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
Updated: 2026-06-03T18:18:45.306198+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.861 |  |
| ap-east-1 | 0.827 |  |
| ap-east-2 | 0.767 |  |
| ap-northeast-1 | 0.645 |  |
| ap-northeast-2 | 0.758 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.823 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.897 |  |
| ap-southeast-2 | 0.820 |  |
| ap-southeast-3 | 0.942 |  |
| ap-southeast-4 | 0.851 |  |
| ap-southeast-5 | 0.915 |  |
| ap-southeast-6 | 0.843 |  |
| ap-southeast-7 | 0.994 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.282 |  |
| eu-central-1 | 0.378 |  |
| eu-central-2 | 0.399 |  |
| eu-north-1 | 0.418 |  |
| eu-south-1 | 0.400 |  |
| eu-south-2 | 0.413 |  |
| eu-west-1 | 0.290 |  |
| eu-west-2 | 0.327 |  |
| eu-west-3 | 0.358 |  |
| il-central-1 | 0.530 |  |
| me-central-1 | 0.744 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.268 |  |
| sa-east-1 | 0.482 |  |
| us-east-1 | 0.048 | 4717 |
| us-east-2 | 0.092 | 1621 |
| us-gov-east-1 | 0.090 | 1708 |
| us-gov-west-1 | 0.328 | 196 |
| us-west-1 | 0.277 | 3630 |
| us-west-2 | 0.334 | 162 |

