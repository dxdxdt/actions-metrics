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
Updated: 2026-03-09T20:26:02.310276+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.046 |  |
| ap-east-1 | 0.645 |  |
| ap-east-2 | 0.596 |  |
| ap-northeast-1 | 0.466 |  |
| ap-northeast-2 | 0.579 |  |
| ap-northeast-3 | 0.493 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.738 |  |
| ap-southeast-2 | 0.617 |  |
| ap-southeast-3 | 0.785 |  |
| ap-southeast-4 | 0.663 |  |
| ap-southeast-5 | 0.748 |  |
| ap-southeast-6 | 0.674 |  |
| ap-southeast-7 | 0.837 |  |
| ca-central-1 | 0.263 | 16 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.577 |  |
| eu-north-1 | 0.615 |  |
| eu-south-1 | 0.581 |  |
| eu-south-2 | 0.594 |  |
| eu-west-1 | 0.490 |  |
| eu-west-2 | 0.517 |  |
| eu-west-3 | 0.525 |  |
| il-central-1 | 0.738 |  |
| me-central-1 | 0.931 |  |
| me-south-1 | 0.890 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.663 |  |
| us-east-1 | 0.219 | 4249 |
| us-east-2 | 0.206 | 1412 |
| us-gov-east-1 | 0.201 | 1549 |
| us-gov-west-1 | 0.144 | 176 |
| us-west-1 | 0.096 | 3204 |
| us-west-2 | 0.143 | 144 |

