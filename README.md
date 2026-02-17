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
Updated: 2026-02-17T17:51:11.138341+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.942 |  |
| ap-east-1 | 0.763 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.688 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.775 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.807 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.824 |  |
| ap-southeast-7 | 0.950 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.454 |  |
| eu-north-1 | 0.488 |  |
| eu-south-1 | 0.470 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.364 |  |
| eu-west-2 | 0.400 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.609 |  |
| me-central-1 | 0.815 |  |
| me-south-1 | 0.793 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.532 |  |
| us-east-1 | 0.092 | 4135 |
| us-east-2 | 0.104 | 1352 |
| us-gov-east-1 | 0.098 | 1485 |
| us-gov-west-1 | 0.266 | 153 |
| us-west-1 | 0.263 | 3068 |
| us-west-2 | 0.275 | 126 |

