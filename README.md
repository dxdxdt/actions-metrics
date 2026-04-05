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
Updated: 2026-04-05T16:28:11.551806+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.896 |  |
| ap-east-1 | 0.791 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.612 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.637 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.914 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.974 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.289 |  |
| eu-central-1 | 0.398 |  |
| eu-central-2 | 0.414 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.425 |  |
| eu-south-2 | 0.433 |  |
| eu-west-1 | 0.316 |  |
| eu-west-2 | 0.354 |  |
| eu-west-3 | 0.376 |  |
| il-central-1 | 0.567 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.501 |  |
| us-east-1 | 0.069 | 4442 |
| us-east-2 | 0.096 | 1483 |
| us-gov-east-1 | 0.105 | 1628 |
| us-gov-west-1 | 0.293 | 191 |
| us-west-1 | 0.243 | 3359 |
| us-west-2 | 0.288 | 153 |

