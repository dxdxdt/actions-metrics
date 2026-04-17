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
Updated: 2026-04-17T08:23:33.808348+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.776 |  |
| ap-east-2 | 0.757 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.720 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.969 |  |
| ap-southeast-1 | 0.854 |  |
| ap-southeast-2 | 0.759 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.811 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.855 |  |
| ap-southeast-7 | 0.953 |  |
| ca-central-1 | 0.153 | 16 |
| ca-west-1 | 0.291 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.440 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.448 |  |
| eu-south-2 | 0.463 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.374 |  |
| eu-west-3 | 0.401 |  |
| il-central-1 | 0.605 |  |
| me-central-1 | 0.826 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.531 |  |
| us-east-1 | 0.092 | 4514 |
| us-east-2 | 0.121 | 1506 |
| us-gov-east-1 | 0.121 | 1652 |
| us-gov-west-1 | 0.270 | 193 |
| us-west-1 | 0.233 | 3425 |
| us-west-2 | 0.269 | 156 |

