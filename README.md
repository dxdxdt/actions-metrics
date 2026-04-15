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
Updated: 2026-04-15T08:24:14.428712+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.052 |  |
| ap-east-1 | 0.653 |  |
| ap-east-2 | 0.596 |  |
| ap-northeast-1 | 0.472 |  |
| ap-northeast-2 | 0.603 |  |
| ap-northeast-3 | 0.502 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.725 |  |
| ap-southeast-2 | 0.610 |  |
| ap-southeast-3 | 0.787 |  |
| ap-southeast-4 | 0.647 |  |
| ap-southeast-5 | 0.748 |  |
| ap-southeast-6 | 0.679 |  |
| ap-southeast-7 | 0.829 |  |
| ca-central-1 | 0.277 | 16 |
| ca-west-1 | 0.188 |  |
| eu-central-1 | 0.585 |  |
| eu-central-2 | 0.586 |  |
| eu-north-1 | 0.623 |  |
| eu-south-1 | 0.591 |  |
| eu-south-2 | 0.592 |  |
| eu-west-1 | 0.492 |  |
| eu-west-2 | 0.536 |  |
| eu-west-3 | 0.540 |  |
| il-central-1 | 0.741 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.689 |  |
| us-east-1 | 0.231 | 4506 |
| us-east-2 | 0.196 | 1500 |
| us-gov-east-1 | 0.207 | 1648 |
| us-gov-west-1 | 0.136 | 193 |
| us-west-1 | 0.080 | 3415 |
| us-west-2 | 0.133 | 155 |

