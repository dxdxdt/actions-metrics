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
Updated: 2026-02-12T04:16:52.119747+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.684 |  |
| ap-northeast-1 | 0.505 |  |
| ap-northeast-2 | 0.613 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.669 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.714 |  |
| ca-central-1 | 0.219 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.557 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.421 |  |
| eu-west-2 | 0.461 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.894 |  |
| me-south-1 | 0.867 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.180 | 4107 |
| us-east-2 | 0.161 | 1332 |
| us-gov-east-1 | 0.157 | 1453 |
| us-gov-west-1 | 0.168 | 145 |
| us-west-1 | 0.155 | 3043 |
| us-west-2 | 0.173 | 125 |

