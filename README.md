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
Updated: 2026-03-12T07:41:42.090600+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.930 |  |
| ap-east-1 | 0.781 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.606 |  |
| ap-northeast-2 | 0.702 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.857 |  |
| ap-southeast-2 | 0.754 |  |
| ap-southeast-3 | 0.904 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.876 |  |
| ap-southeast-6 | 0.822 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.140 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.428 |  |
| eu-central-2 | 0.447 |  |
| eu-north-1 | 0.485 |  |
| eu-south-1 | 0.465 |  |
| eu-south-2 | 0.460 |  |
| eu-west-1 | 0.357 |  |
| eu-west-2 | 0.392 |  |
| eu-west-3 | 0.407 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.809 |  |
| me-south-1 | 0.781 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.097 | 4262 |
| us-east-2 | 0.110 | 1419 |
| us-gov-east-1 | 0.110 | 1565 |
| us-gov-west-1 | 0.261 | 180 |
| us-west-1 | 0.227 | 3214 |
| us-west-2 | 0.264 | 144 |

