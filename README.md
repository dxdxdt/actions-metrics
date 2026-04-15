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
Updated: 2026-04-15T01:48:24.304872+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.924 |  |
| ap-east-1 | 0.763 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.572 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.612 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.755 |  |
| ap-southeast-3 | 0.911 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.944 |  |
| ca-central-1 | 0.172 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.483 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.403 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.630 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.549 |  |
| us-east-1 | 0.111 | 4506 |
| us-east-2 | 0.132 | 1500 |
| us-gov-east-1 | 0.139 | 1647 |
| us-gov-west-1 | 0.270 | 193 |
| us-west-1 | 0.209 | 3413 |
| us-west-2 | 0.256 | 155 |

