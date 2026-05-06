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
Updated: 2026-05-06T10:59:34.855637+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.003 |  |
| ap-east-1 | 0.719 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.644 |  |
| ap-northeast-3 | 0.570 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.972 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.710 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.832 |  |
| ap-southeast-6 | 0.773 |  |
| ap-southeast-7 | 0.890 |  |
| ca-central-1 | 0.169 | 16 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.511 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.511 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.438 |  |
| eu-west-3 | 0.471 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.136 | 4603 |
| us-east-2 | 0.137 | 1568 |
| us-gov-east-1 | 0.115 | 1675 |
| us-gov-west-1 | 0.212 | 194 |
| us-west-1 | 0.163 | 3536 |
| us-west-2 | 0.217 | 157 |

