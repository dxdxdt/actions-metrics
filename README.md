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
Updated: 2025-10-04T03:19:26.190964+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.904 |  |
| ap-east-1 | 0.798 |  |
| ap-northeast-1 | 0.598 |  |
| ap-northeast-2 | 0.709 |  |
| ap-south-1 | 0.970 |  |
| ap-southeast-1 | 0.858 |  |
| ap-southeast-2 | 0.758 |  |
| ca-central-1 | 0.134 | 15 |
| eu-central-1 | 0.416 |  |
| eu-north-1 | 0.452 |  |
| eu-south-1 | 0.434 |  |
| eu-west-1 | 0.331 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.391 |  |
| me-south-1 | 0.724 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.082 | 3218 |
| us-east-2 | 0.095 | 847 |
| us-gov-east-1 | 0.107 | 1048 |
| us-gov-west-1 | 0.272 | 44 |
| us-west-1 | 0.230 | 2149 |
| us-west-2 | 0.275 | 18 |

