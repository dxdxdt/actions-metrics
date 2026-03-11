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
Updated: 2026-03-11T23:19:09.330587+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.046 |  |
| ap-east-1 | 0.661 |  |
| ap-east-2 | 0.606 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.593 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.736 |  |
| ap-southeast-2 | 0.633 |  |
| ap-southeast-3 | 0.793 |  |
| ap-southeast-4 | 0.668 |  |
| ap-southeast-5 | 0.757 |  |
| ap-southeast-6 | 0.668 |  |
| ap-southeast-7 | 0.837 |  |
| ca-central-1 | 0.243 | 16 |
| ca-west-1 | 0.184 |  |
| eu-central-1 | 0.553 |  |
| eu-central-2 | 0.572 |  |
| eu-north-1 | 0.606 |  |
| eu-south-1 | 0.580 |  |
| eu-south-2 | 0.583 |  |
| eu-west-1 | 0.480 |  |
| eu-west-2 | 0.513 |  |
| eu-west-3 | 0.531 |  |
| il-central-1 | 0.735 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.886 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.212 | 4260 |
| us-east-2 | 0.185 | 1419 |
| us-gov-east-1 | 0.183 | 1564 |
| us-gov-west-1 | 0.146 | 179 |
| us-west-1 | 0.112 | 3213 |
| us-west-2 | 0.148 | 144 |

