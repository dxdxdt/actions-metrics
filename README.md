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
Updated: 2026-03-04T23:23:42.615720+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.883 |  |
| ap-east-1 | 0.808 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.628 |  |
| ap-northeast-2 | 0.733 |  |
| ap-northeast-3 | 0.649 |  |
| ap-south-1 | 0.860 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.891 |  |
| ap-southeast-2 | 0.776 |  |
| ap-southeast-3 | 0.947 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.899 |  |
| ap-southeast-6 | 0.840 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.108 | 16 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.403 |  |
| eu-central-2 | 0.416 |  |
| eu-north-1 | 0.447 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.325 |  |
| eu-west-2 | 0.353 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.572 |  |
| me-central-1 | 0.773 |  |
| me-south-1 | 0.735 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.490 |  |
| us-east-1 | 0.059 | 4222 |
| us-east-2 | 0.104 | 1398 |
| us-gov-east-1 | 0.096 | 1531 |
| us-gov-west-1 | 0.310 | 170 |
| us-west-1 | 0.249 | 3172 |
| us-west-2 | 0.309 | 140 |

