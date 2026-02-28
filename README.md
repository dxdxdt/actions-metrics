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
Updated: 2026-02-28T23:15:25.616103+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.722 |  |
| ap-east-2 | 0.663 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.649 |  |
| ap-northeast-3 | 0.568 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.795 |  |
| ap-southeast-2 | 0.696 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.794 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.150 | 16 |
| ca-west-1 | 0.195 |  |
| eu-central-1 | 0.486 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.414 |  |
| eu-west-2 | 0.438 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.856 |  |
| me-south-1 | 0.811 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.585 |  |
| us-east-1 | 0.137 | 4201 |
| us-east-2 | 0.111 | 1386 |
| us-gov-east-1 | 0.112 | 1519 |
| us-gov-west-1 | 0.196 | 166 |
| us-west-1 | 0.194 | 3143 |
| us-west-2 | 0.198 | 134 |

