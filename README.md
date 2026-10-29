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
Updated: 2026-10-29T07:52:20.684467+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.776 |  |
| ap-east-1 | 0.500 |  |
| ap-east-2 | 0.453 |  |
| ap-northeast-1 | 0.366 |  |
| ap-northeast-2 | 0.445 |  |
| ap-northeast-3 | 0.384 |  |
| ap-south-1 | 0.679 |  |
| ap-south-2 | 0.671 |  |
| ap-southeast-1 | 0.556 |  |
| ap-southeast-2 | 0.472 |  |
| ap-southeast-3 | 0.600 |  |
| ap-southeast-4 | 0.532 |  |
| ap-southeast-5 | 0.572 |  |
| ap-southeast-6 | 0.531 |  |
| ap-southeast-7 | 0.633 |  |
| ca-central-1 | 0.196 | 18 |
| ca-west-1 | 0.187 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.428 |  |
| eu-north-1 | 0.445 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.414 |  |
| eu-west-1 | 0.353 |  |
| eu-west-2 | 0.381 |  |
| eu-west-3 | 0.397 |  |
| il-central-1 | 0.533 |  |
| me-central-1 | 0.705 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.164 |  |
| sa-east-1 | 0.494 |  |
| us-east-1 | 0.158 | 5166 |
| us-east-2 | 0.157 | 1714 |
| us-gov-east-1 | 0.171 | 1955 |
| us-gov-west-1 | 0.120 | 240 |
| us-west-1 | 0.073 | 4199 |
| us-west-2 | 0.120 | 195 |

