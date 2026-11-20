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
Updated: 2026-11-20T07:55:42.935182+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.737 |  |
| ap-east-1 | 0.504 |  |
| ap-east-2 | 0.459 |  |
| ap-northeast-1 | 0.368 |  |
| ap-northeast-2 | 0.447 |  |
| ap-northeast-3 | 0.389 |  |
| ap-south-1 | 0.666 |  |
| ap-south-2 | 0.682 |  |
| ap-southeast-1 | 0.565 |  |
| ap-southeast-2 | 0.506 |  |
| ap-southeast-3 | 0.607 |  |
| ap-southeast-4 | 0.560 |  |
| ap-southeast-5 | 0.575 |  |
| ap-southeast-6 | 0.520 |  |
| ap-southeast-7 | 0.638 |  |
| ca-central-1 | 0.167 | 18 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.389 |  |
| eu-central-2 | 0.405 |  |
| eu-north-1 | 0.433 |  |
| eu-south-1 | 0.410 |  |
| eu-south-2 | 0.400 |  |
| eu-west-1 | 0.326 |  |
| eu-west-2 | 0.355 |  |
| eu-west-3 | 0.377 |  |
| il-central-1 | 0.510 |  |
| me-central-1 | 0.669 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.710 |  |
| mx-central-1 | 0.192 |  |
| sa-east-1 | 0.486 |  |
| us-east-1 | 0.144 | 5191 |
| us-east-2 | 0.141 | 1730 |
| us-gov-east-1 | 0.150 | 1963 |
| us-gov-west-1 | 0.121 | 248 |
| us-west-1 | 0.119 | 4220 |
| us-west-2 | 0.121 | 199 |

