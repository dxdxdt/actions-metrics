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
Updated: 2026-02-13T23:23:46.572847+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.015 |  |
| ap-east-1 | 0.700 |  |
| ap-east-2 | 0.628 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.623 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.764 |  |
| ap-southeast-2 | 0.661 |  |
| ap-southeast-3 | 0.820 |  |
| ap-southeast-4 | 0.700 |  |
| ap-southeast-5 | 0.781 |  |
| ap-southeast-6 | 0.701 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.219 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.522 |  |
| eu-central-2 | 0.543 |  |
| eu-north-1 | 0.580 |  |
| eu-south-1 | 0.552 |  |
| eu-south-2 | 0.562 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.489 |  |
| eu-west-3 | 0.502 |  |
| il-central-1 | 0.711 |  |
| me-central-1 | 0.900 |  |
| me-south-1 | 0.873 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.178 | 4118 |
| us-east-2 | 0.163 | 1339 |
| us-gov-east-1 | 0.164 | 1459 |
| us-gov-west-1 | 0.175 | 147 |
| us-west-1 | 0.147 | 3055 |
| us-west-2 | 0.174 | 125 |

