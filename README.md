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
Updated: 2026-07-31T11:23:20.150468+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.989 |  |
| ap-east-1 | 0.688 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.509 |  |
| ap-northeast-2 | 0.611 |  |
| ap-northeast-3 | 0.532 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.666 |  |
| ap-southeast-3 | 0.825 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.783 |  |
| ap-southeast-6 | 0.702 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.223 | 17 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.541 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.526 |  |
| eu-south-2 | 0.539 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.468 |  |
| eu-west-3 | 0.484 |  |
| il-central-1 | 0.662 |  |
| me-central-1 | 0.896 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.617 |  |
| us-east-1 | 0.164 | 4924 |
| us-east-2 | 0.184 | 1672 |
| us-gov-east-1 | 0.184 | 1790 |
| us-gov-west-1 | 0.198 | 208 |
| us-west-1 | 0.134 | 3859 |
| us-west-2 | 0.198 | 172 |

