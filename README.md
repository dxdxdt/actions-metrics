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
Updated: 2026-06-23T10:30:29.682872+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.613 |  |
| ap-northeast-1 | 0.499 |  |
| ap-northeast-2 | 0.593 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.934 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.689 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.855 |  |
| ca-central-1 | 0.253 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.536 |  |
| eu-central-2 | 0.566 |  |
| eu-north-1 | 0.579 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.570 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.497 |  |
| eu-west-3 | 0.515 |  |
| il-central-1 | 0.686 |  |
| me-central-1 | 0.951 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.202 | 4785 |
| us-east-2 | 0.176 | 1638 |
| us-gov-east-1 | 0.168 | 1717 |
| us-gov-west-1 | 0.167 | 198 |
| us-west-1 | 0.108 | 3694 |
| us-west-2 | 0.167 | 163 |

