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
Updated: 2026-10-27T19:08:07.012346+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.673 |  |
| ap-east-1 | 0.625 |  |
| ap-east-2 | 0.573 |  |
| ap-northeast-1 | 0.487 |  |
| ap-northeast-2 | 0.566 |  |
| ap-northeast-3 | 0.508 |  |
| ap-south-1 | 0.639 |  |
| ap-south-2 | 0.713 |  |
| ap-southeast-1 | 0.678 |  |
| ap-southeast-2 | 0.599 |  |
| ap-southeast-3 | 0.728 |  |
| ap-southeast-4 | 0.663 |  |
| ap-southeast-5 | 0.691 |  |
| ap-southeast-6 | 0.643 |  |
| ap-southeast-7 | 0.760 |  |
| ca-central-1 | 0.083 | 18 |
| ca-west-1 | 0.172 |  |
| eu-central-1 | 0.304 |  |
| eu-central-2 | 0.318 |  |
| eu-north-1 | 0.351 |  |
| eu-south-1 | 0.320 |  |
| eu-south-2 | 0.308 |  |
| eu-west-1 | 0.247 |  |
| eu-west-2 | 0.278 |  |
| eu-west-3 | 0.287 |  |
| il-central-1 | 0.426 |  |
| me-central-1 | 0.752 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.382 |  |
| us-east-1 | 0.041 | 5164 |
| us-east-2 | 0.080 | 1712 |
| us-gov-east-1 | 0.083 | 1955 |
| us-gov-west-1 | 0.240 | 240 |
| us-west-1 | 0.207 | 4196 |
| us-west-2 | 0.242 | 195 |

