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
Updated: 2026-08-15T20:14:18.820350+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.518 |  |
| ap-northeast-2 | 0.621 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.778 |  |
| ap-southeast-2 | 0.657 |  |
| ap-southeast-3 | 0.840 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.702 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.234 | 18 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.508 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.564 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.542 |  |
| eu-west-1 | 0.431 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.180 | 5003 |
| us-east-2 | 0.185 | 1679 |
| us-gov-east-1 | 0.176 | 1831 |
| us-gov-west-1 | 0.189 | 222 |
| us-west-1 | 0.134 | 3959 |
| us-west-2 | 0.189 | 178 |

