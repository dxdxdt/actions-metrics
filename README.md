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
Updated: 2026-05-07T11:02:59.445853+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.900 |  |
| ap-east-1 | 0.794 |  |
| ap-east-2 | 0.724 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.714 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.984 |  |
| ap-southeast-1 | 0.913 |  |
| ap-southeast-2 | 0.797 |  |
| ap-southeast-3 | 0.956 |  |
| ap-southeast-4 | 0.830 |  |
| ap-southeast-5 | 0.889 |  |
| ap-southeast-6 | 0.857 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.280 |  |
| eu-central-1 | 0.418 |  |
| eu-central-2 | 0.425 |  |
| eu-north-1 | 0.459 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.442 |  |
| eu-west-1 | 0.331 |  |
| eu-west-2 | 0.363 |  |
| eu-west-3 | 0.384 |  |
| il-central-1 | 0.559 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.512 |  |
| us-east-1 | 0.071 | 4607 |
| us-east-2 | 0.086 | 1570 |
| us-gov-east-1 | 0.087 | 1680 |
| us-gov-west-1 | 0.313 | 194 |
| us-west-1 | 0.253 | 3536 |
| us-west-2 | 0.315 | 157 |

