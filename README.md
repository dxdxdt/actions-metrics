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
Updated: 2026-02-16T06:02:48.032599+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.916 |  |
| ap-east-1 | 0.768 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.699 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.949 |  |
| ap-southeast-1 | 0.842 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.798 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.795 |  |
| ap-southeast-7 | 0.945 |  |
| ca-central-1 | 0.134 | 16 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.480 |  |
| eu-south-1 | 0.455 |  |
| eu-south-2 | 0.461 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.815 |  |
| me-south-1 | 0.776 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.095 | 4128 |
| us-east-2 | 0.102 | 1348 |
| us-gov-east-1 | 0.106 | 1475 |
| us-gov-west-1 | 0.256 | 149 |
| us-west-1 | 0.237 | 3063 |
| us-west-2 | 0.257 | 125 |

