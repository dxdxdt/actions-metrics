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
Updated: 2026-03-07T21:14:59.703391+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.906 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.707 |  |
| ap-northeast-3 | 0.618 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.754 |  |
| ap-southeast-3 | 0.905 |  |
| ap-southeast-4 | 0.795 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.955 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.430 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.451 |  |
| eu-south-2 | 0.451 |  |
| eu-west-1 | 0.344 |  |
| eu-west-2 | 0.378 |  |
| eu-west-3 | 0.393 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.797 |  |
| me-south-1 | 0.760 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.519 |  |
| us-east-1 | 0.075 | 4237 |
| us-east-2 | 0.096 | 1407 |
| us-gov-east-1 | 0.088 | 1541 |
| us-gov-west-1 | 0.267 | 174 |
| us-west-1 | 0.238 | 3191 |
| us-west-2 | 0.267 | 143 |

