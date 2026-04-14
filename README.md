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
Updated: 2026-04-14T06:27:43.624699+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.960 |  |
| ap-southeast-1 | 0.814 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.788 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.173 | 16 |
| ca-west-1 | 0.292 |  |
| eu-central-1 | 0.458 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.371 |  |
| eu-west-2 | 0.424 |  |
| eu-west-3 | 0.439 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.822 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.565 |  |
| us-east-1 | 0.118 | 4498 |
| us-east-2 | 0.129 | 1499 |
| us-gov-east-1 | 0.125 | 1646 |
| us-gov-west-1 | 0.237 | 193 |
| us-west-1 | 0.187 | 3410 |
| us-west-2 | 0.241 | 155 |

