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
Updated: 2026-07-11T16:45:29.170793+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.735 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.721 |  |
| ap-northeast-3 | 0.645 |  |
| ap-south-1 | 0.838 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.870 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.918 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.895 |  |
| ap-southeast-6 | 0.804 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.399 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.441 |  |
| eu-south-1 | 0.425 |  |
| eu-south-2 | 0.440 |  |
| eu-west-1 | 0.315 |  |
| eu-west-2 | 0.350 |  |
| eu-west-3 | 0.383 |  |
| il-central-1 | 0.549 |  |
| me-central-1 | 0.786 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.516 |  |
| us-east-1 | 0.061 | 4850 |
| us-east-2 | 0.080 | 1656 |
| us-gov-east-1 | 0.086 | 1738 |
| us-gov-west-1 | 0.289 | 202 |
| us-west-1 | 0.239 | 3765 |
| us-west-2 | 0.290 | 165 |

