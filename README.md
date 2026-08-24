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
Updated: 2026-08-24T16:26:55.177824+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.945 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.589 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.968 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.719 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.837 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.921 |  |
| ca-central-1 | 0.142 | 18 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.484 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.414 |  |
| eu-west-3 | 0.434 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.814 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.592 |  |
| us-east-1 | 0.131 | 5053 |
| us-east-2 | 0.117 | 1683 |
| us-gov-east-1 | 0.098 | 1880 |
| us-gov-west-1 | 0.230 | 227 |
| us-west-1 | 0.180 | 4045 |
| us-west-2 | 0.232 | 186 |

