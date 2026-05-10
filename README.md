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
Updated: 2026-05-10T14:21:21.328745+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.792 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.713 |  |
| ap-northeast-3 | 0.630 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.780 |  |
| ap-southeast-3 | 0.915 |  |
| ap-southeast-4 | 0.813 |  |
| ap-southeast-5 | 0.884 |  |
| ap-southeast-6 | 0.891 |  |
| ap-southeast-7 | 0.972 |  |
| ca-central-1 | 0.110 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.404 |  |
| eu-central-2 | 0.428 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.432 |  |
| eu-south-2 | 0.440 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.369 |  |
| eu-west-3 | 0.388 |  |
| il-central-1 | 0.564 |  |
| me-central-1 | 0.781 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.513 |  |
| us-east-1 | 0.067 | 4621 |
| us-east-2 | 0.076 | 1583 |
| us-gov-east-1 | 0.090 | 1685 |
| us-gov-west-1 | 0.298 | 195 |
| us-west-1 | 0.240 | 3547 |
| us-west-2 | 0.290 | 157 |

