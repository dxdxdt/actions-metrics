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
Updated: 2026-07-28T17:37:19.907542+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.032 |  |
| ap-east-1 | 0.647 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.591 |  |
| ap-northeast-3 | 0.508 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.629 |  |
| ap-southeast-3 | 0.791 |  |
| ap-southeast-4 | 0.671 |  |
| ap-southeast-5 | 0.759 |  |
| ap-southeast-6 | 0.663 |  |
| ap-southeast-7 | 0.839 |  |
| ca-central-1 | 0.270 | 17 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.558 |  |
| eu-central-2 | 0.562 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.583 |  |
| eu-south-2 | 0.584 |  |
| eu-west-1 | 0.473 |  |
| eu-west-2 | 0.509 |  |
| eu-west-3 | 0.540 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.926 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.220 | 4916 |
| us-east-2 | 0.185 | 1670 |
| us-gov-east-1 | 0.193 | 1782 |
| us-gov-west-1 | 0.147 | 207 |
| us-west-1 | 0.102 | 3848 |
| us-west-2 | 0.146 | 171 |

