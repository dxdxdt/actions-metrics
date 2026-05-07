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
Updated: 2026-05-07T20:59:51.881328+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.903 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.613 |  |
| ap-northeast-2 | 0.715 |  |
| ap-northeast-3 | 0.636 |  |
| ap-south-1 | 0.846 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.776 |  |
| ap-southeast-3 | 0.919 |  |
| ap-southeast-4 | 0.828 |  |
| ap-southeast-5 | 0.899 |  |
| ap-southeast-6 | 0.849 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.103 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.421 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.446 |  |
| eu-west-1 | 0.326 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.560 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.513 |  |
| us-east-1 | 0.064 | 4609 |
| us-east-2 | 0.075 | 1572 |
| us-gov-east-1 | 0.085 | 1680 |
| us-gov-west-1 | 0.285 | 194 |
| us-west-1 | 0.254 | 3537 |
| us-west-2 | 0.291 | 157 |

