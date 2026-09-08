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
Updated: 2026-09-08T07:37:53.747368+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.052 |  |
| ap-east-1 | 0.654 |  |
| ap-east-2 | 0.593 |  |
| ap-northeast-1 | 0.475 |  |
| ap-northeast-2 | 0.582 |  |
| ap-northeast-3 | 0.502 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.609 |  |
| ap-southeast-3 | 0.783 |  |
| ap-southeast-4 | 0.652 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.661 |  |
| ap-southeast-7 | 0.831 |  |
| ca-central-1 | 0.308 | 18 |
| ca-west-1 | 0.182 |  |
| eu-central-1 | 0.565 |  |
| eu-central-2 | 0.585 |  |
| eu-north-1 | 0.649 |  |
| eu-south-1 | 0.600 |  |
| eu-south-2 | 0.617 |  |
| eu-west-1 | 0.498 |  |
| eu-west-2 | 0.530 |  |
| eu-west-3 | 0.540 |  |
| il-central-1 | 0.730 |  |
| me-central-1 | 0.978 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.671 |  |
| us-east-1 | 0.230 | 5091 |
| us-east-2 | 0.232 | 1685 |
| us-gov-east-1 | 0.215 | 1902 |
| us-gov-west-1 | 0.139 | 231 |
| us-west-1 | 0.080 | 4090 |
| us-west-2 | 0.136 | 192 |

