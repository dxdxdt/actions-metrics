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
Updated: 2026-03-08T13:35:55.294276+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.038 |  |
| ap-east-1 | 0.652 |  |
| ap-east-2 | 0.601 |  |
| ap-northeast-1 | 0.476 |  |
| ap-northeast-2 | 0.585 |  |
| ap-northeast-3 | 0.503 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.729 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.782 |  |
| ap-southeast-4 | 0.703 |  |
| ap-southeast-5 | 0.752 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.827 |  |
| ca-central-1 | 0.222 | 16 |
| ca-west-1 | 0.151 |  |
| eu-central-1 | 0.541 |  |
| eu-central-2 | 0.559 |  |
| eu-north-1 | 0.589 |  |
| eu-south-1 | 0.582 |  |
| eu-south-2 | 0.574 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.486 |  |
| eu-west-3 | 0.524 |  |
| il-central-1 | 0.734 |  |
| me-central-1 | 0.909 |  |
| me-south-1 | 0.875 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.656 |  |
| us-east-1 | 0.210 | 4240 |
| us-east-2 | 0.172 | 1408 |
| us-gov-east-1 | 0.167 | 1544 |
| us-gov-west-1 | 0.135 | 175 |
| us-west-1 | 0.162 | 3195 |
| us-west-2 | 0.134 | 144 |

