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
Updated: 2026-03-15T04:27:13.920616+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.983 |  |
| ap-east-1 | 0.711 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.957 |  |
| ap-southeast-1 | 0.785 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.843 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.803 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.191 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.495 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.527 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.407 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.827 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.600 |  |
| us-east-1 | 0.158 | 4280 |
| us-east-2 | 0.136 | 1423 |
| us-gov-east-1 | 0.137 | 1576 |
| us-gov-west-1 | 0.190 | 185 |
| us-west-1 | 0.182 | 3233 |
| us-west-2 | 0.189 | 147 |

