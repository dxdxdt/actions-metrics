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
Updated: 2026-03-16T01:30:48.771125+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.972 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.669 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.860 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.820 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.159 | 16 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.499 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.503 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.410 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.460 |  |
| il-central-1 | 0.663 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.812 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.127 | 4286 |
| us-east-2 | 0.122 | 1427 |
| us-gov-east-1 | 0.138 | 1577 |
| us-gov-west-1 | 0.212 | 185 |
| us-west-1 | 0.194 | 3240 |
| us-west-2 | 0.212 | 148 |

