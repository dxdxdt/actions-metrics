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
Updated: 2026-07-23T19:02:10.746034+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.044 |  |
| ap-east-1 | 0.656 |  |
| ap-east-2 | 0.599 |  |
| ap-northeast-1 | 0.479 |  |
| ap-northeast-2 | 0.582 |  |
| ap-northeast-3 | 0.507 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.620 |  |
| ap-southeast-3 | 0.788 |  |
| ap-southeast-4 | 0.662 |  |
| ap-southeast-5 | 0.752 |  |
| ap-southeast-6 | 0.656 |  |
| ap-southeast-7 | 0.832 |  |
| ca-central-1 | 0.274 | 16 |
| ca-west-1 | 0.185 |  |
| eu-central-1 | 0.567 |  |
| eu-central-2 | 0.582 |  |
| eu-north-1 | 0.619 |  |
| eu-south-1 | 0.595 |  |
| eu-south-2 | 0.598 |  |
| eu-west-1 | 0.491 |  |
| eu-west-2 | 0.524 |  |
| eu-west-3 | 0.554 |  |
| il-central-1 | 0.730 |  |
| me-central-1 | 0.952 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.672 |  |
| us-east-1 | 0.226 | 4901 |
| us-east-2 | 0.193 | 1660 |
| us-gov-east-1 | 0.197 | 1776 |
| us-gov-west-1 | 0.142 | 206 |
| us-west-1 | 0.055 | 3824 |
| us-west-2 | 0.142 | 168 |

