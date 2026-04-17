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
Updated: 2026-04-17T21:35:47.781340+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.957 |  |
| ap-east-1 | 0.752 |  |
| ap-east-2 | 0.686 |  |
| ap-northeast-1 | 0.577 |  |
| ap-northeast-2 | 0.674 |  |
| ap-northeast-3 | 0.603 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.827 |  |
| ap-southeast-2 | 0.745 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.515 |  |
| eu-south-1 | 0.489 |  |
| eu-south-2 | 0.497 |  |
| eu-west-1 | 0.394 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.446 |  |
| il-central-1 | 0.634 |  |
| me-central-1 | 0.827 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.106 | 4518 |
| us-east-2 | 0.080 | 1510 |
| us-gov-east-1 | 0.088 | 1654 |
| us-gov-west-1 | 0.243 | 194 |
| us-west-1 | 0.193 | 3425 |
| us-west-2 | 0.252 | 156 |

