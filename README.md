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
Updated: 2026-03-11T19:38:15.951359+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.746 |  |
| ap-east-2 | 0.689 |  |
| ap-northeast-1 | 0.570 |  |
| ap-northeast-2 | 0.676 |  |
| ap-northeast-3 | 0.595 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.820 |  |
| ap-southeast-2 | 0.747 |  |
| ap-southeast-3 | 0.876 |  |
| ap-southeast-4 | 0.789 |  |
| ap-southeast-5 | 0.839 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.450 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.501 |  |
| eu-south-1 | 0.469 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.438 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.818 |  |
| me-south-1 | 0.773 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.567 |  |
| us-east-1 | 0.116 | 4260 |
| us-east-2 | 0.096 | 1419 |
| us-gov-east-1 | 0.088 | 1563 |
| us-gov-west-1 | 0.236 | 179 |
| us-west-1 | 0.235 | 3210 |
| us-west-2 | 0.239 | 144 |

