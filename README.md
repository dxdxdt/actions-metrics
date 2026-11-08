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
Updated: 2026-11-08T03:38:39.939784+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.684 |  |
| ap-east-1 | 0.577 |  |
| ap-east-2 | 0.532 |  |
| ap-northeast-1 | 0.442 |  |
| ap-northeast-2 | 0.518 |  |
| ap-northeast-3 | 0.461 |  |
| ap-south-1 | 0.643 |  |
| ap-south-2 | 0.734 |  |
| ap-southeast-1 | 0.632 |  |
| ap-southeast-2 | 0.556 |  |
| ap-southeast-3 | 0.676 |  |
| ap-southeast-4 | 0.620 |  |
| ap-southeast-5 | 0.647 |  |
| ap-southeast-6 | 0.576 |  |
| ap-southeast-7 | 0.712 |  |
| ca-central-1 | 0.102 | 18 |
| ca-west-1 | 0.171 |  |
| eu-central-1 | 0.329 |  |
| eu-central-2 | 0.337 |  |
| eu-north-1 | 0.356 |  |
| eu-south-1 | 0.341 |  |
| eu-south-2 | 0.333 |  |
| eu-west-1 | 0.262 |  |
| eu-west-2 | 0.290 |  |
| eu-west-3 | 0.308 |  |
| il-central-1 | 0.446 |  |
| me-central-1 | 0.581 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.175 |  |
| sa-east-1 | 0.402 |  |
| us-east-1 | 0.074 | 5178 |
| us-east-2 | 0.087 | 1721 |
| us-gov-east-1 | 0.098 | 1959 |
| us-gov-west-1 | 0.202 | 245 |
| us-west-1 | 0.161 | 4210 |
| us-west-2 | 0.202 | 196 |

