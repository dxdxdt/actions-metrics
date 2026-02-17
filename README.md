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
Updated: 2026-02-17T10:38:05.857583+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.611 |  |
| ap-south-1 | 0.974 |  |
| ap-south-2 | 1.000 |  |
| ap-southeast-1 | 0.757 |  |
| ap-southeast-2 | 0.672 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.712 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.773 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.211 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.529 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.435 |  |
| eu-west-2 | 0.471 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.857 |  |
| mx-central-1 | 0.195 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.162 | 4134 |
| us-east-2 | 0.162 | 1350 |
| us-gov-east-1 | 0.136 | 1484 |
| us-gov-west-1 | 0.157 | 153 |
| us-west-1 | 0.173 | 3066 |
| us-west-2 | 0.157 | 126 |

