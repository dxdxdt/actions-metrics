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
Updated: 2026-03-01T23:16:46.913772+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.050 |  |
| ap-east-1 | 0.635 |  |
| ap-east-2 | 0.570 |  |
| ap-northeast-1 | 0.449 |  |
| ap-northeast-2 | 0.551 |  |
| ap-northeast-3 | 0.473 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.711 |  |
| ap-southeast-2 | 0.605 |  |
| ap-southeast-3 | 0.766 |  |
| ap-southeast-4 | 0.645 |  |
| ap-southeast-5 | 0.732 |  |
| ap-southeast-6 | 0.644 |  |
| ap-southeast-7 | 0.808 |  |
| ca-central-1 | 0.309 | 16 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.569 |  |
| eu-central-2 | 0.590 |  |
| eu-north-1 | 0.621 |  |
| eu-south-1 | 0.605 |  |
| eu-south-2 | 0.603 |  |
| eu-west-1 | 0.500 |  |
| eu-west-2 | 0.532 |  |
| eu-west-3 | 0.548 |  |
| il-central-1 | 0.768 |  |
| me-central-1 | 0.942 |  |
| me-south-1 | 0.889 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.681 |  |
| us-east-1 | 0.229 | 4207 |
| us-east-2 | 0.216 | 1387 |
| us-gov-east-1 | 0.218 | 1519 |
| us-gov-west-1 | 0.138 | 167 |
| us-west-1 | 0.079 | 3154 |
| us-west-2 | 0.140 | 136 |

