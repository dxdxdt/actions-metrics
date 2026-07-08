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
Updated: 2026-07-08T08:11:49.827703+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.969 |  |
| ap-east-1 | 0.710 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.532 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.555 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.939 |  |
| ap-southeast-1 | 0.787 |  |
| ap-southeast-2 | 0.692 |  |
| ap-southeast-3 | 0.848 |  |
| ap-southeast-4 | 0.742 |  |
| ap-southeast-5 | 0.809 |  |
| ap-southeast-6 | 0.733 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.211 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.497 |  |
| eu-central-2 | 0.521 |  |
| eu-north-1 | 0.535 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.535 |  |
| eu-west-1 | 0.424 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.653 |  |
| me-central-1 | 0.860 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.605 |  |
| us-east-1 | 0.142 | 4833 |
| us-east-2 | 0.149 | 1656 |
| us-gov-east-1 | 0.157 | 1730 |
| us-gov-west-1 | 0.216 | 201 |
| us-west-1 | 0.168 | 3756 |
| us-west-2 | 0.215 | 164 |

