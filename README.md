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
Updated: 2026-06-02T00:11:41.433845+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.752 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.679 |  |
| ap-northeast-3 | 0.599 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.838 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.848 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.151 | 16 |
| ca-west-1 | 0.293 |  |
| eu-central-1 | 0.455 |  |
| eu-central-2 | 0.480 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.488 |  |
| eu-south-2 | 0.493 |  |
| eu-west-1 | 0.378 |  |
| eu-west-2 | 0.414 |  |
| eu-west-3 | 0.436 |  |
| il-central-1 | 0.612 |  |
| me-central-1 | 0.903 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.559 |  |
| us-east-1 | 0.111 | 4711 |
| us-east-2 | 0.102 | 1619 |
| us-gov-east-1 | 0.104 | 1708 |
| us-gov-west-1 | 0.247 | 196 |
| us-west-1 | 0.188 | 3629 |
| us-west-2 | 0.252 | 161 |

