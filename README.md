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
Updated: 2026-08-17T19:21:38.131773+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.003 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.628 |  |
| ap-northeast-1 | 0.511 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.536 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.764 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.705 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.864 |  |
| ca-central-1 | 0.215 | 18 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.513 |  |
| eu-central-2 | 0.536 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.549 |  |
| eu-west-1 | 0.428 |  |
| eu-west-2 | 0.472 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.900 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.172 | 5012 |
| us-east-2 | 0.178 | 1680 |
| us-gov-east-1 | 0.150 | 1840 |
| us-gov-west-1 | 0.180 | 224 |
| us-west-1 | 0.120 | 3980 |
| us-west-2 | 0.181 | 181 |

