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
Updated: 2026-02-17T22:23:22.212764+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.939 |  |
| ap-east-1 | 0.764 |  |
| ap-east-2 | 0.691 |  |
| ap-northeast-1 | 0.572 |  |
| ap-northeast-2 | 0.673 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.840 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.890 |  |
| ap-southeast-4 | 0.765 |  |
| ap-southeast-5 | 0.860 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.164 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.454 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.503 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.381 |  |
| eu-west-2 | 0.411 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.788 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.550 |  |
| us-east-1 | 0.111 | 4137 |
| us-east-2 | 0.130 | 1353 |
| us-gov-east-1 | 0.127 | 1486 |
| us-gov-west-1 | 0.246 | 153 |
| us-west-1 | 0.210 | 3069 |
| us-west-2 | 0.251 | 126 |

