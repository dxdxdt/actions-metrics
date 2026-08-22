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
Updated: 2026-08-22T09:19:26.955559+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.739 |  |
| ap-east-2 | 0.676 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.665 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.830 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.913 |  |
| ca-central-1 | 0.163 | 18 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.469 |  |
| eu-central-2 | 0.494 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.500 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.388 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.626 |  |
| me-central-1 | 0.830 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.580 |  |
| us-east-1 | 0.124 | 5044 |
| us-east-2 | 0.134 | 1681 |
| us-gov-east-1 | 0.121 | 1869 |
| us-gov-west-1 | 0.231 | 225 |
| us-west-1 | 0.173 | 4018 |
| us-west-2 | 0.228 | 184 |

