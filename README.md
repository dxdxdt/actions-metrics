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
Updated: 2026-03-29T21:25:28.451699+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.728 |  |
| ap-northeast-1 | 0.611 |  |
| ap-northeast-2 | 0.720 |  |
| ap-northeast-3 | 0.634 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.786 |  |
| ap-southeast-3 | 0.926 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.827 |  |
| ap-southeast-7 | 0.977 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.339 |  |
| eu-central-1 | 0.393 |  |
| eu-central-2 | 0.418 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.429 |  |
| eu-south-2 | 0.457 |  |
| eu-west-1 | 0.325 |  |
| eu-west-2 | 0.352 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.577 |  |
| me-central-1 | 0.778 |  |
| me-south-1 | 0.750 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.500 |  |
| us-east-1 | 0.060 | 4395 |
| us-east-2 | 0.085 | 1466 |
| us-gov-east-1 | 0.085 | 1613 |
| us-gov-west-1 | 0.314 | 190 |
| us-west-1 | 0.243 | 3317 |
| us-west-2 | 0.304 | 152 |

