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
Updated: 2026-10-04T23:45:20.550421+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.695 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.830 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.801 |  |
| ap-southeast-6 | 0.737 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.186 | 18 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.488 |  |
| eu-central-2 | 0.506 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.517 |  |
| eu-south-2 | 0.513 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.863 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.610 |  |
| us-east-1 | 0.149 | 5137 |
| us-east-2 | 0.154 | 1690 |
| us-gov-east-1 | 0.142 | 1933 |
| us-gov-west-1 | 0.200 | 237 |
| us-west-1 | 0.152 | 4156 |
| us-west-2 | 0.202 | 193 |

