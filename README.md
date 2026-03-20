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
Updated: 2026-03-20T20:24:10.334604+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.739 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.561 |  |
| ap-northeast-2 | 0.665 |  |
| ap-northeast-3 | 0.588 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.766 |  |
| ap-southeast-7 | 0.917 |  |
| ca-central-1 | 0.128 | 16 |
| ca-west-1 | 0.212 |  |
| eu-central-1 | 0.475 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.459 |  |
| il-central-1 | 0.643 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.800 |  |
| mx-central-1 | 0.182 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.103 | 4317 |
| us-east-2 | 0.091 | 1443 |
| us-gov-east-1 | 0.095 | 1591 |
| us-gov-west-1 | 0.217 | 189 |
| us-west-1 | 0.204 | 3267 |
| us-west-2 | 0.218 | 148 |

