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
Updated: 2026-07-15T17:08:20.761348+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.995 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.630 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.667 |  |
| ap-southeast-3 | 0.824 |  |
| ap-southeast-4 | 0.709 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.705 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.203 | 16 |
| ca-west-1 | 0.202 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.564 |  |
| eu-south-1 | 0.538 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.473 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.680 |  |
| me-central-1 | 0.897 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.620 |  |
| us-east-1 | 0.174 | 4871 |
| us-east-2 | 0.168 | 1656 |
| us-gov-east-1 | 0.145 | 1754 |
| us-gov-west-1 | 0.189 | 202 |
| us-west-1 | 0.131 | 3781 |
| us-west-2 | 0.190 | 166 |

