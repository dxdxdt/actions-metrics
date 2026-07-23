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
Updated: 2026-07-23T22:56:53.091045+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.695 |  |
| ap-east-2 | 0.636 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.616 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.781 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.712 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.701 |  |
| ap-southeast-7 | 0.884 |  |
| ca-central-1 | 0.227 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.497 |  |
| eu-central-2 | 0.536 |  |
| eu-north-1 | 0.560 |  |
| eu-south-1 | 0.526 |  |
| eu-south-2 | 0.538 |  |
| eu-west-1 | 0.434 |  |
| eu-west-2 | 0.459 |  |
| eu-west-3 | 0.505 |  |
| il-central-1 | 0.665 |  |
| me-central-1 | 0.900 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.165 | 4902 |
| us-east-2 | 0.184 | 1660 |
| us-gov-east-1 | 0.166 | 1777 |
| us-gov-west-1 | 0.201 | 206 |
| us-west-1 | 0.136 | 3825 |
| us-west-2 | 0.203 | 168 |

