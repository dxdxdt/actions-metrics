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
Updated: 2026-03-12T12:40:42.533293+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.863 |  |
| ap-east-1 | 0.815 |  |
| ap-east-2 | 0.760 |  |
| ap-northeast-1 | 0.639 |  |
| ap-northeast-2 | 0.761 |  |
| ap-northeast-3 | 0.665 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.893 |  |
| ap-southeast-2 | 0.810 |  |
| ap-southeast-3 | 0.947 |  |
| ap-southeast-4 | 0.852 |  |
| ap-southeast-5 | 0.911 |  |
| ap-southeast-6 | 0.883 |  |
| ap-southeast-7 | 0.992 |  |
| ca-central-1 | 0.099 | 16 |
| ca-west-1 | 0.291 |  |
| eu-central-1 | 0.370 |  |
| eu-central-2 | 0.387 |  |
| eu-north-1 | 0.418 |  |
| eu-south-1 | 0.394 |  |
| eu-south-2 | 0.410 |  |
| eu-west-1 | 0.288 |  |
| eu-west-2 | 0.321 |  |
| eu-west-3 | 0.356 |  |
| il-central-1 | 0.550 |  |
| me-central-1 | 0.736 |  |
| me-south-1 | 0.706 |  |
| mx-central-1 | 0.257 |  |
| sa-east-1 | 0.471 |  |
| us-east-1 | 0.042 | 4267 |
| us-east-2 | 0.088 | 1419 |
| us-gov-east-1 | 0.087 | 1565 |
| us-gov-west-1 | 0.320 | 180 |
| us-west-1 | 0.264 | 3214 |
| us-west-2 | 0.340 | 144 |

