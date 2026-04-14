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
Updated: 2026-04-14T16:58:02.759837+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.716 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.644 |  |
| ap-northeast-3 | 0.568 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.788 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.807 |  |
| ap-southeast-6 | 0.730 |  |
| ap-southeast-7 | 0.882 |  |
| ca-central-1 | 0.211 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.528 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.422 |  |
| eu-west-2 | 0.463 |  |
| eu-west-3 | 0.489 |  |
| il-central-1 | 0.678 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.163 | 4502 |
| us-east-2 | 0.157 | 1500 |
| us-gov-east-1 | 0.168 | 1646 |
| us-gov-west-1 | 0.216 | 193 |
| us-west-1 | 0.158 | 3411 |
| us-west-2 | 0.205 | 155 |

