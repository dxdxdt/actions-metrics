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
Updated: 2026-02-26T04:10:06.307361+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.930 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.691 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.600 |  |
| ap-south-1 | 0.884 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.739 |  |
| ap-southeast-3 | 0.880 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.803 |  |
| ap-southeast-7 | 0.930 |  |
| ca-central-1 | 0.155 | 16 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.449 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.469 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.359 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.429 |  |
| il-central-1 | 0.616 |  |
| me-central-1 | 0.814 |  |
| me-south-1 | 0.772 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.554 |  |
| us-east-1 | 0.105 | 4184 |
| us-east-2 | 0.114 | 1380 |
| us-gov-east-1 | 0.115 | 1510 |
| us-gov-west-1 | 0.251 | 162 |
| us-west-1 | 0.213 | 3120 |
| us-west-2 | 0.247 | 132 |

