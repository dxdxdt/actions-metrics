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
Updated: 2026-09-06T09:59:37.319113+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.706 |  |
| ap-northeast-1 | 0.590 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.872 |  |
| ap-southeast-2 | 0.751 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.793 |  |
| ap-southeast-5 | 0.878 |  |
| ap-southeast-6 | 0.788 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.151 | 18 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.409 |  |
| eu-central-2 | 0.428 |  |
| eu-north-1 | 0.478 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.458 |  |
| eu-west-1 | 0.337 |  |
| eu-west-2 | 0.373 |  |
| eu-west-3 | 0.390 |  |
| il-central-1 | 0.578 |  |
| me-central-1 | 0.818 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.512 |  |
| us-east-1 | 0.083 | 5087 |
| us-east-2 | 0.108 | 1685 |
| us-gov-east-1 | 0.120 | 1898 |
| us-gov-west-1 | 0.287 | 231 |
| us-west-1 | 0.219 | 4085 |
| us-west-2 | 0.286 | 192 |

