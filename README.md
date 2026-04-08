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
Updated: 2026-04-08T11:47:21.399671+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.027 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.518 |  |
| ap-northeast-2 | 0.593 |  |
| ap-northeast-3 | 0.520 |  |
| ap-south-1 | 0.938 |  |
| ap-south-2 | 0.965 |  |
| ap-southeast-1 | 0.742 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.800 |  |
| ap-southeast-4 | 0.686 |  |
| ap-southeast-5 | 0.761 |  |
| ap-southeast-6 | 0.685 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.238 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.540 |  |
| eu-central-2 | 0.568 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.566 |  |
| eu-south-2 | 0.575 |  |
| eu-west-1 | 0.459 |  |
| eu-west-2 | 0.493 |  |
| eu-west-3 | 0.518 |  |
| il-central-1 | 0.715 |  |
| me-central-1 | 0.915 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.648 |  |
| us-east-1 | 0.192 | 4456 |
| us-east-2 | 0.164 | 1489 |
| us-gov-east-1 | 0.164 | 1634 |
| us-gov-west-1 | 0.163 | 192 |
| us-west-1 | 0.106 | 3377 |
| us-west-2 | 0.160 | 154 |

