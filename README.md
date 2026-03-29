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
Updated: 2026-03-29T07:48:59.942388+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.781 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.626 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.851 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.804 |  |
| ap-southeast-5 | 0.872 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.964 |  |
| ca-central-1 | 0.110 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.437 |  |
| eu-north-1 | 0.472 |  |
| eu-south-1 | 0.443 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.346 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.404 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.796 |  |
| me-south-1 | 0.751 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.076 | 4387 |
| us-east-2 | 0.083 | 1462 |
| us-gov-east-1 | 0.082 | 1611 |
| us-gov-west-1 | 0.286 | 190 |
| us-west-1 | 0.228 | 3317 |
| us-west-2 | 0.277 | 152 |

