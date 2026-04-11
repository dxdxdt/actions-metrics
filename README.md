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
Updated: 2026-04-11T08:34:29.840404+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.074 |  |
| ap-east-1 | 0.631 |  |
| ap-east-2 | 0.569 |  |
| ap-northeast-1 | 0.454 |  |
| ap-northeast-2 | 0.559 |  |
| ap-northeast-3 | 0.480 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.705 |  |
| ap-southeast-2 | 0.590 |  |
| ap-southeast-3 | 0.760 |  |
| ap-southeast-4 | 0.631 |  |
| ap-southeast-5 | 0.724 |  |
| ap-southeast-6 | 0.645 |  |
| ap-southeast-7 | 0.816 |  |
| ca-central-1 | 0.298 | 16 |
| ca-west-1 | 0.183 |  |
| eu-central-1 | 0.603 |  |
| eu-central-2 | 0.605 |  |
| eu-north-1 | 0.641 |  |
| eu-south-1 | 0.631 |  |
| eu-south-2 | 0.631 |  |
| eu-west-1 | 0.515 |  |
| eu-west-2 | 0.557 |  |
| eu-west-3 | 0.560 |  |
| il-central-1 | 0.773 |  |
| me-central-1 | 0.955 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.700 |  |
| us-east-1 | 0.254 | 4475 |
| us-east-2 | 0.203 | 1492 |
| us-gov-east-1 | 0.225 | 1640 |
| us-gov-west-1 | 0.113 | 192 |
| us-west-1 | 0.062 | 3395 |
| us-west-2 | 0.114 | 155 |

