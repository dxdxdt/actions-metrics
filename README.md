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
Updated: 2026-02-22T20:18:15.196002+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.781 |  |
| ap-east-2 | 0.726 |  |
| ap-northeast-1 | 0.611 |  |
| ap-northeast-2 | 0.713 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.800 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.780 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.823 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 0.967 |  |
| ca-central-1 | 0.134 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.406 |  |
| eu-central-2 | 0.425 |  |
| eu-north-1 | 0.454 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.446 |  |
| eu-west-1 | 0.327 |  |
| eu-west-2 | 0.365 |  |
| eu-west-3 | 0.386 |  |
| il-central-1 | 0.596 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.752 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.503 |  |
| us-east-1 | 0.074 | 4165 |
| us-east-2 | 0.112 | 1371 |
| us-gov-east-1 | 0.111 | 1500 |
| us-gov-west-1 | 0.301 | 160 |
| us-west-1 | 0.253 | 3099 |
| us-west-2 | 0.316 | 130 |

