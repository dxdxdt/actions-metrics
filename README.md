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
Updated: 2026-11-07T02:29:26.966190+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.705 |  |
| ap-east-1 | 0.543 |  |
| ap-east-2 | 0.510 |  |
| ap-northeast-1 | 0.406 |  |
| ap-northeast-2 | 0.482 |  |
| ap-northeast-3 | 0.424 |  |
| ap-south-1 | 0.657 |  |
| ap-south-2 | 0.675 |  |
| ap-southeast-1 | 0.607 |  |
| ap-southeast-2 | 0.530 |  |
| ap-southeast-3 | 0.643 |  |
| ap-southeast-4 | 0.586 |  |
| ap-southeast-5 | 0.616 |  |
| ap-southeast-6 | 0.553 |  |
| ap-southeast-7 | 0.681 |  |
| ca-central-1 | 0.138 | 18 |
| ca-west-1 | 0.176 |  |
| eu-central-1 | 0.345 |  |
| eu-central-2 | 0.371 |  |
| eu-north-1 | 0.387 |  |
| eu-south-1 | 0.361 |  |
| eu-south-2 | 0.351 |  |
| eu-west-1 | 0.291 |  |
| eu-west-2 | 0.326 |  |
| eu-west-3 | 0.333 |  |
| il-central-1 | 0.471 |  |
| me-central-1 | 0.615 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.164 |  |
| sa-east-1 | 0.425 |  |
| us-east-1 | 0.098 | 5175 |
| us-east-2 | 0.121 | 1721 |
| us-gov-east-1 | 0.120 | 1959 |
| us-gov-west-1 | 0.177 | 245 |
| us-west-1 | 0.136 | 4208 |
| us-west-2 | 0.178 | 196 |

