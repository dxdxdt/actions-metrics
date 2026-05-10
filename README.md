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
Updated: 2026-05-10T19:54:30.955915+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.612 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.639 |  |
| ap-south-1 | 0.836 |  |
| ap-south-2 | 0.902 |  |
| ap-southeast-1 | 0.872 |  |
| ap-southeast-2 | 0.784 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.894 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.398 |  |
| eu-central-2 | 0.422 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.322 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.381 |  |
| il-central-1 | 0.561 |  |
| me-central-1 | 0.782 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.504 |  |
| us-east-1 | 0.062 | 4623 |
| us-east-2 | 0.081 | 1586 |
| us-gov-east-1 | 0.081 | 1685 |
| us-gov-west-1 | 0.308 | 195 |
| us-west-1 | 0.260 | 3547 |
| us-west-2 | 0.309 | 157 |

