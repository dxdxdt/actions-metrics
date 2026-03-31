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
Updated: 2026-03-31T08:04:12.797822+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.904 |  |
| ap-east-1 | 0.787 |  |
| ap-east-2 | 0.726 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.722 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.858 |  |
| ap-southeast-2 | 0.773 |  |
| ap-southeast-3 | 0.916 |  |
| ap-southeast-4 | 0.814 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.855 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.419 |  |
| eu-central-2 | 0.433 |  |
| eu-north-1 | 0.471 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.457 |  |
| eu-west-1 | 0.336 |  |
| eu-west-2 | 0.374 |  |
| eu-west-3 | 0.397 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.789 |  |
| me-south-1 | 0.753 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.518 |  |
| us-east-1 | 0.074 | 4405 |
| us-east-2 | 0.079 | 1468 |
| us-gov-east-1 | 0.086 | 1616 |
| us-gov-west-1 | 0.299 | 190 |
| us-west-1 | 0.231 | 3324 |
| us-west-2 | 0.291 | 152 |

