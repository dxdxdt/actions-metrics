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
Updated: 2026-04-13T09:30:05.191147+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.703 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.868 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.773 |  |
| ap-southeast-3 | 0.909 |  |
| ap-southeast-4 | 0.811 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.840 |  |
| ap-southeast-7 | 0.946 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.282 |  |
| eu-central-1 | 0.419 |  |
| eu-central-2 | 0.442 |  |
| eu-north-1 | 0.489 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.337 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.398 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.798 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.521 |  |
| us-east-1 | 0.079 | 4492 |
| us-east-2 | 0.104 | 1498 |
| us-gov-east-1 | 0.103 | 1646 |
| us-gov-west-1 | 0.282 | 192 |
| us-west-1 | 0.240 | 3405 |
| us-west-2 | 0.282 | 155 |

