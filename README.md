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
Updated: 2026-04-05T13:50:04.745870+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.718 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.714 |  |
| ap-northeast-3 | 0.627 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.769 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.808 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.804 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.136 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.429 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.446 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.371 |  |
| eu-west-3 | 0.392 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.083 | 4440 |
| us-east-2 | 0.103 | 1483 |
| us-gov-east-1 | 0.112 | 1628 |
| us-gov-west-1 | 0.277 | 191 |
| us-west-1 | 0.240 | 3358 |
| us-west-2 | 0.284 | 153 |

