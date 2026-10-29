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
Updated: 2026-10-29T19:59:34.589170+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.772 |  |
| ap-east-1 | 0.481 |  |
| ap-east-2 | 0.436 |  |
| ap-northeast-1 | 0.345 |  |
| ap-northeast-2 | 0.421 |  |
| ap-northeast-3 | 0.364 |  |
| ap-south-1 | 0.696 |  |
| ap-south-2 | 0.668 |  |
| ap-southeast-1 | 0.541 |  |
| ap-southeast-2 | 0.462 |  |
| ap-southeast-3 | 0.581 |  |
| ap-southeast-4 | 0.522 |  |
| ap-southeast-5 | 0.554 |  |
| ap-southeast-6 | 0.515 |  |
| ap-southeast-7 | 0.615 |  |
| ca-central-1 | 0.208 | 18 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.411 |  |
| eu-central-2 | 0.429 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.431 |  |
| eu-south-2 | 0.416 |  |
| eu-west-1 | 0.360 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.398 |  |
| il-central-1 | 0.534 |  |
| me-central-1 | 0.690 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.150 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.165 | 5166 |
| us-east-2 | 0.183 | 1714 |
| us-gov-east-1 | 0.194 | 1955 |
| us-gov-west-1 | 0.117 | 240 |
| us-west-1 | 0.066 | 4201 |
| us-west-2 | 0.117 | 195 |

