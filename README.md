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
Updated: 2026-03-27T04:28:40.670033+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.909 |  |
| ap-east-1 | 0.772 |  |
| ap-east-2 | 0.711 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.725 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.910 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.870 |  |
| ap-southeast-6 | 0.840 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.437 |  |
| eu-north-1 | 0.478 |  |
| eu-south-1 | 0.446 |  |
| eu-south-2 | 0.481 |  |
| eu-west-1 | 0.346 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.404 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.777 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.075 | 4368 |
| us-east-2 | 0.084 | 1457 |
| us-gov-east-1 | 0.079 | 1607 |
| us-gov-west-1 | 0.284 | 190 |
| us-west-1 | 0.231 | 3304 |
| us-west-2 | 0.276 | 151 |

