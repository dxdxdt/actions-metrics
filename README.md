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
Updated: 2026-07-28T13:44:52.875305+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.994 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.624 |  |
| ap-northeast-1 | 0.499 |  |
| ap-northeast-2 | 0.611 |  |
| ap-northeast-3 | 0.526 |  |
| ap-south-1 | 0.878 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.683 |  |
| ap-southeast-3 | 0.811 |  |
| ap-southeast-4 | 0.735 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.731 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.240 | 17 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.513 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.569 |  |
| eu-south-1 | 0.537 |  |
| eu-south-2 | 0.542 |  |
| eu-west-1 | 0.431 |  |
| eu-west-2 | 0.465 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.926 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.254 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.181 | 4916 |
| us-east-2 | 0.182 | 1670 |
| us-gov-east-1 | 0.187 | 1781 |
| us-gov-west-1 | 0.177 | 207 |
| us-west-1 | 0.174 | 3847 |
| us-west-2 | 0.176 | 171 |

