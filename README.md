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
Updated: 2026-03-25T12:50:43.017678+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.877 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.728 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.725 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.882 |  |
| ap-southeast-2 | 0.776 |  |
| ap-southeast-3 | 0.934 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.903 |  |
| ap-southeast-6 | 0.818 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.392 |  |
| eu-central-2 | 0.411 |  |
| eu-north-1 | 0.453 |  |
| eu-south-1 | 0.424 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.324 |  |
| eu-west-2 | 0.352 |  |
| eu-west-3 | 0.369 |  |
| il-central-1 | 0.567 |  |
| me-central-1 | 0.804 |  |
| me-south-1 | 0.750 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.492 |  |
| us-east-1 | 0.062 | 4358 |
| us-east-2 | 0.092 | 1452 |
| us-gov-east-1 | 0.090 | 1602 |
| us-gov-west-1 | 0.309 | 190 |
| us-west-1 | 0.255 | 3295 |
| us-west-2 | 0.300 | 151 |

