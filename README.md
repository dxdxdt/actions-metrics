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
Updated: 2026-03-01T09:22:54.438806+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.707 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.904 |  |
| ap-southeast-4 | 0.800 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.948 |  |
| ca-central-1 | 0.122 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.418 |  |
| eu-central-2 | 0.430 |  |
| eu-north-1 | 0.467 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.375 |  |
| eu-west-3 | 0.395 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.787 |  |
| me-south-1 | 0.757 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.520 |  |
| us-east-1 | 0.081 | 4203 |
| us-east-2 | 0.104 | 1387 |
| us-gov-east-1 | 0.110 | 1519 |
| us-gov-west-1 | 0.263 | 166 |
| us-west-1 | 0.232 | 3146 |
| us-west-2 | 0.263 | 135 |

