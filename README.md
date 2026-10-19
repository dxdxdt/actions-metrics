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
Updated: 2026-10-19T11:41:45.110703+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.995 |  |
| ap-east-1 | 0.665 |  |
| ap-east-2 | 0.601 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.588 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.745 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.689 |  |
| ap-southeast-5 | 0.761 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.844 |  |
| ca-central-1 | 0.237 | 18 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.537 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.545 |  |
| eu-south-2 | 0.528 |  |
| eu-west-1 | 0.448 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.191 | 5153 |
| us-east-2 | 0.216 | 1703 |
| us-gov-east-1 | 0.214 | 1949 |
| us-gov-west-1 | 0.180 | 239 |
| us-west-1 | 0.116 | 4177 |
| us-west-2 | 0.180 | 195 |

