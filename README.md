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
Updated: 2026-02-17T16:48:11.593873+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.005 |  |
| ap-east-1 | 0.709 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.530 |  |
| ap-northeast-2 | 0.634 |  |
| ap-south-1 | 0.935 |  |
| ap-south-2 | 1.011 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.838 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.802 |  |
| ap-southeast-6 | 0.773 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.202 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.516 |  |
| eu-north-1 | 0.558 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.538 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.474 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.679 |  |
| me-central-1 | 0.888 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.193 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.143 | 4134 |
| us-east-2 | 0.117 | 1352 |
| us-gov-east-1 | 0.110 | 1485 |
| us-gov-west-1 | 0.186 | 153 |
| us-west-1 | 0.197 | 3068 |
| us-west-2 | 0.185 | 126 |

