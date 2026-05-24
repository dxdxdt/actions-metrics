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
Updated: 2026-05-24T21:49:17.651809+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.711 |  |
| ap-east-2 | 0.646 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.783 |  |
| ap-southeast-2 | 0.673 |  |
| ap-southeast-3 | 0.846 |  |
| ap-southeast-4 | 0.714 |  |
| ap-southeast-5 | 0.805 |  |
| ap-southeast-6 | 0.708 |  |
| ap-southeast-7 | 0.890 |  |
| ca-central-1 | 0.222 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.496 |  |
| eu-central-2 | 0.521 |  |
| eu-north-1 | 0.547 |  |
| eu-south-1 | 0.528 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.457 |  |
| eu-west-3 | 0.480 |  |
| il-central-1 | 0.686 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.615 |  |
| us-east-1 | 0.179 | 4687 |
| us-east-2 | 0.165 | 1611 |
| us-gov-east-1 | 0.179 | 1704 |
| us-gov-west-1 | 0.202 | 195 |
| us-west-1 | 0.146 | 3595 |
| us-west-2 | 0.200 | 160 |

