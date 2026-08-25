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
Updated: 2026-08-25T09:27:11.163122+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.749 |  |
| ap-east-2 | 0.705 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.681 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.858 |  |
| ap-southeast-6 | 0.764 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.173 | 18 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.466 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.468 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.371 |  |
| eu-west-2 | 0.395 |  |
| eu-west-3 | 0.412 |  |
| il-central-1 | 0.594 |  |
| me-central-1 | 0.807 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.537 |  |
| us-east-1 | 0.104 | 5060 |
| us-east-2 | 0.126 | 1684 |
| us-gov-east-1 | 0.147 | 1882 |
| us-gov-west-1 | 0.262 | 227 |
| us-west-1 | 0.205 | 4050 |
| us-west-2 | 0.259 | 187 |

