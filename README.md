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
Updated: 2026-07-13T14:11:40.914874+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.887 |  |
| ap-east-1 | 0.817 |  |
| ap-east-2 | 0.762 |  |
| ap-northeast-1 | 0.641 |  |
| ap-northeast-2 | 0.746 |  |
| ap-northeast-3 | 0.666 |  |
| ap-south-1 | 0.850 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.894 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.947 |  |
| ap-southeast-4 | 0.827 |  |
| ap-southeast-5 | 0.912 |  |
| ap-southeast-6 | 0.821 |  |
| ap-southeast-7 | 0.991 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.284 |  |
| eu-central-1 | 0.391 |  |
| eu-central-2 | 0.419 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.432 |  |
| eu-south-2 | 0.429 |  |
| eu-west-1 | 0.322 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.556 |  |
| me-central-1 | 0.789 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.064 | 4864 |
| us-east-2 | 0.087 | 1656 |
| us-gov-east-1 | 0.098 | 1743 |
| us-gov-west-1 | 0.301 | 202 |
| us-west-1 | 0.252 | 3773 |
| us-west-2 | 0.302 | 165 |

