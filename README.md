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
Updated: 2026-03-03T11:27:09.163602+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.057 |  |
| ap-east-1 | 0.651 |  |
| ap-east-2 | 0.592 |  |
| ap-northeast-1 | 0.473 |  |
| ap-northeast-2 | 0.581 |  |
| ap-northeast-3 | 0.495 |  |
| ap-south-1 | 0.914 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.723 |  |
| ap-southeast-2 | 0.612 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.653 |  |
| ap-southeast-5 | 0.745 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.832 |  |
| ca-central-1 | 0.261 | 16 |
| ca-west-1 | 0.184 |  |
| eu-central-1 | 0.568 |  |
| eu-central-2 | 0.579 |  |
| eu-north-1 | 0.631 |  |
| eu-south-1 | 0.601 |  |
| eu-south-2 | 0.594 |  |
| eu-west-1 | 0.500 |  |
| eu-west-2 | 0.541 |  |
| eu-west-3 | 0.548 |  |
| il-central-1 | 0.732 |  |
| me-central-1 | 0.952 |  |
| me-south-1 | 0.905 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.670 |  |
| us-east-1 | 0.226 | 4212 |
| us-east-2 | 0.202 | 1393 |
| us-gov-east-1 | 0.201 | 1526 |
| us-gov-west-1 | 0.137 | 169 |
| us-west-1 | 0.093 | 3164 |
| us-west-2 | 0.138 | 136 |

