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
Updated: 2026-07-14T17:05:45.946435+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.918 |  |
| ap-east-1 | 0.767 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.590 |  |
| ap-northeast-2 | 0.696 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.993 |  |
| ap-southeast-1 | 0.845 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.784 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.769 |  |
| ap-southeast-7 | 0.949 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.460 |  |
| eu-north-1 | 0.500 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.477 |  |
| eu-west-1 | 0.356 |  |
| eu-west-2 | 0.389 |  |
| eu-west-3 | 0.411 |  |
| il-central-1 | 0.595 |  |
| me-central-1 | 0.796 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.548 |  |
| us-east-1 | 0.084 | 4870 |
| us-east-2 | 0.101 | 1656 |
| us-gov-east-1 | 0.084 | 1749 |
| us-gov-west-1 | 0.264 | 202 |
| us-west-1 | 0.210 | 3775 |
| us-west-2 | 0.262 | 165 |

