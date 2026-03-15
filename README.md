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
Updated: 2026-03-15T18:28:27.116429+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.050 |  |
| ap-east-1 | 0.661 |  |
| ap-east-2 | 0.606 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.590 |  |
| ap-northeast-3 | 0.509 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.626 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.667 |  |
| ap-southeast-5 | 0.756 |  |
| ap-southeast-6 | 0.668 |  |
| ap-southeast-7 | 0.835 |  |
| ca-central-1 | 0.255 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.567 |  |
| eu-north-1 | 0.600 |  |
| eu-south-1 | 0.570 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.482 |  |
| eu-west-2 | 0.511 |  |
| eu-west-3 | 0.519 |  |
| il-central-1 | 0.733 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.883 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.652 |  |
| us-east-1 | 0.207 | 4284 |
| us-east-2 | 0.186 | 1425 |
| us-gov-east-1 | 0.197 | 1577 |
| us-gov-west-1 | 0.145 | 185 |
| us-west-1 | 0.109 | 3238 |
| us-west-2 | 0.144 | 148 |

