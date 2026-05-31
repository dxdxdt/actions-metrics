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
Updated: 2026-05-31T20:01:40.898403+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.000 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.633 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.620 |  |
| ap-northeast-3 | 0.539 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.702 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.791 |  |
| ap-southeast-6 | 0.724 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.219 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.507 |  |
| eu-central-2 | 0.523 |  |
| eu-north-1 | 0.548 |  |
| eu-south-1 | 0.528 |  |
| eu-south-2 | 0.540 |  |
| eu-west-1 | 0.414 |  |
| eu-west-2 | 0.466 |  |
| eu-west-3 | 0.480 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.836 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.262 |  |
| sa-east-1 | 0.624 |  |
| us-east-1 | 0.167 | 4708 |
| us-east-2 | 0.157 | 1617 |
| us-gov-east-1 | 0.175 | 1708 |
| us-gov-west-1 | 0.185 | 196 |
| us-west-1 | 0.175 | 3625 |
| us-west-2 | 0.185 | 161 |

