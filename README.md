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
Updated: 2026-01-12T14:18:50.927311+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.111 |  |
| ap-east-1 | 0.634 |  |
| ap-northeast-1 | 0.437 |  |
| ap-northeast-2 | 0.545 |  |
| ap-south-1 | 0.901 |  |
| ap-southeast-1 | 0.736 |  |
| ap-southeast-2 | 0.565 |  |
| ca-central-1 | 0.316 | 16 |
| eu-central-1 | 0.629 |  |
| eu-north-1 | 0.659 |  |
| eu-south-1 | 0.651 |  |
| eu-west-1 | 0.535 |  |
| eu-west-2 | 0.567 |  |
| eu-west-3 | 0.589 |  |
| me-south-1 | 0.974 |  |
| sa-east-1 | 0.726 |  |
| us-east-1 | 0.287 | 3917 |
| us-east-2 | 0.243 | 1233 |
| us-gov-east-1 | 0.244 | 1360 |
| us-gov-west-1 | 0.093 | 111 |
| us-west-1 | 0.040 | 2838 |
| us-west-2 | 0.099 | 103 |

