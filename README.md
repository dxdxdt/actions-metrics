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
Updated: 2026-11-23T01:16:32.114844+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.764 |  |
| ap-east-1 | 0.487 |  |
| ap-east-2 | 0.440 |  |
| ap-northeast-1 | 0.351 |  |
| ap-northeast-2 | 0.430 |  |
| ap-northeast-3 | 0.371 |  |
| ap-south-1 | 0.666 |  |
| ap-south-2 | 0.667 |  |
| ap-southeast-1 | 0.542 |  |
| ap-southeast-2 | 0.487 |  |
| ap-southeast-3 | 0.588 |  |
| ap-southeast-4 | 0.540 |  |
| ap-southeast-5 | 0.557 |  |
| ap-southeast-6 | 0.510 |  |
| ap-southeast-7 | 0.621 |  |
| ca-central-1 | 0.179 | 18 |
| ca-west-1 | 0.166 |  |
| eu-central-1 | 0.408 |  |
| eu-central-2 | 0.427 |  |
| eu-north-1 | 0.435 |  |
| eu-south-1 | 0.416 |  |
| eu-south-2 | 0.419 |  |
| eu-west-1 | 0.356 |  |
| eu-west-2 | 0.378 |  |
| eu-west-3 | 0.389 |  |
| il-central-1 | 0.530 |  |
| me-central-1 | 0.675 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.709 |  |
| mx-central-1 | 0.182 |  |
| sa-east-1 | 0.509 |  |
| us-east-1 | 0.157 | 5194 |
| us-east-2 | 0.150 | 1730 |
| us-gov-east-1 | 0.154 | 1966 |
| us-gov-west-1 | 0.097 | 249 |
| us-west-1 | 0.098 | 4222 |
| us-west-2 | 0.097 | 200 |

