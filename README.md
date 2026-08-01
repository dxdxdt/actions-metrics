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
Updated: 2026-08-01T13:01:30.838349+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.928 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.689 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.678 |  |
| ap-northeast-3 | 0.601 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.868 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.717 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.844 |  |
| ap-southeast-6 | 0.760 |  |
| ap-southeast-7 | 0.930 |  |
| ca-central-1 | 0.180 | 17 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.442 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.490 |  |
| eu-south-1 | 0.468 |  |
| eu-south-2 | 0.478 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.554 |  |
| us-east-1 | 0.119 | 4929 |
| us-east-2 | 0.141 | 1673 |
| us-gov-east-1 | 0.139 | 1791 |
| us-gov-west-1 | 0.240 | 209 |
| us-west-1 | 0.189 | 3864 |
| us-west-2 | 0.240 | 172 |

