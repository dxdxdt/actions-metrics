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
Updated: 2026-03-17T11:38:59.042704+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.644 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.912 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.775 |  |
| ap-southeast-2 | 0.676 |  |
| ap-southeast-3 | 0.828 |  |
| ap-southeast-4 | 0.717 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.881 |  |
| ca-central-1 | 0.183 | 16 |
| ca-west-1 | 0.189 |  |
| eu-central-1 | 0.511 |  |
| eu-central-2 | 0.525 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.533 |  |
| eu-south-2 | 0.549 |  |
| eu-west-1 | 0.435 |  |
| eu-west-2 | 0.468 |  |
| eu-west-3 | 0.491 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.854 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.163 | 4296 |
| us-east-2 | 0.134 | 1430 |
| us-gov-east-1 | 0.132 | 1582 |
| us-gov-west-1 | 0.178 | 186 |
| us-west-1 | 0.169 | 3246 |
| us-west-2 | 0.179 | 148 |

